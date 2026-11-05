# -*- coding: utf-8 -*-
"""
Generate Flutter screens for S49-S96 from the cached Figma node trees.

The output is intentionally layout-faithful: every Figma node is placed at its
absolute position inside a 390 px design canvas. FigmaScreen then scales the
whole canvas to the device width, which keeps pixel spacing, type and assets
identical to the design at any viewport width.
"""

import os
import re
import json
import math

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLUTTER = os.path.join(ROOT, "frontend", "flutter")
MANIFEST_FILE = os.path.join(ROOT, "tools", "cache", "s49_s96", "manifest.json")
SCREENS_DIR = os.path.join(FLUTTER, "lib", "screens")
ROUTES_FILE = os.path.join(FLUTTER, "lib", "routes_s49_s96.dart")

OLD_SCREEN_BY_NUMBER = {
    48: "/s48_next_course_recommendations",
}


def pascal(value):
    parts = re.split(r"[^A-Za-z0-9]+", value)
    return "".join(part[:1].upper() + part[1:] for part in parts if part)


def slug(value):
    return re.sub(r"[^a-z0-9]+", "_", value.lower()).strip("_")


def dart_string(value):
    value = value.replace("\\", "\\\\").replace("$", "\\$").replace("'", "\\'")
    value = value.replace("\r", "\\r").replace("\n", "\\n").replace("\t", "\\t")
    return "'" + value + "'"


def num(value, digits=2):
    if value is None:
        return "0"
    rounded = round(float(value), digits)
    if abs(rounded - round(rounded)) < 0.0001:
        return str(int(round(rounded)))
    return ("%.*f" % (digits, rounded)).rstrip("0").rstrip(".")


def visible_paints(paints):
    return [
        paint
        for paint in (paints or [])
        if paint.get("visible") is not False and paint.get("opacity", 1) > 0
    ]


def color_literal(color, extra_alpha=1.0):
    if not color:
        return "Color(0xFF000000)"
    red = int(round(color.get("r", 0) * 255))
    green = int(round(color.get("g", 0) * 255))
    blue = int(round(color.get("b", 0) * 255))
    alpha = int(round(color.get("a", 1) * extra_alpha * 255))
    if alpha >= 255:
        return f"Color(0xFF{red:02X}{green:02X}{blue:02X})"
    return f"Color.fromARGB({alpha}, {red}, {green}, {blue})"


def first_solid(paints, fallback=None):
    for paint in reversed(visible_paints(paints)):
        if paint.get("type") == "SOLID":
            return color_literal(paint.get("color"), paint.get("opacity", 1))
    for paint in reversed(visible_paints(paints)):
        if paint.get("type") and "GRADIENT" in paint["type"]:
            stops = paint.get("gradientStops") or []
            if stops:
                return color_literal(stops[0].get("color"))
    return fallback


def gradient_literal(paint):
    stops = paint.get("gradientStops") or []
    if len(stops) < 2:
        return None
    colors = ", ".join(color_literal(stop.get("color")) for stop in stops)
    positions = ", ".join(num(stop.get("position", 0), 4) for stop in stops)
    handles = paint.get("gradientHandlePositions") or []
    if len(handles) >= 2:
        begin = handles[0]
        end = handles[1]
        begin_align = (
            f"Alignment({num(begin.get('x', 0) * 2 - 1, 3)}, "
            f"{num(begin.get('y', 0) * 2 - 1, 3)})"
        )
        end_align = (
            f"Alignment({num(end.get('x', 0) * 2 - 1, 3)}, "
            f"{num(end.get('y', 0) * 2 - 1, 3)})"
        )
    else:
        begin_align = "Alignment.topLeft"
        end_align = "Alignment.bottomRight"
    paint_type = paint.get("type", "")
    if paint_type == "GRADIENT_RADIAL" or paint_type == "GRADIENT_DIAMOND":
        center = begin_align
        return (
            "RadialGradient(center: %s, radius: 1.0, colors: [%s], stops: [%s])"
            % (center, colors, positions)
        )
    if paint_type == "GRADIENT_ANGULAR":
        return (
            "SweepGradient(center: %s, colors: [%s], stops: [%s])"
            % (begin_align, colors, positions)
        )
    return (
        "LinearGradient(begin: %s, end: %s, colors: [%s], stops: [%s])"
        % (begin_align, end_align, colors, positions)
    )


def pick_fill(node):
    for paint in reversed(visible_paints(node.get("fills"))):
        if paint.get("type") == "SOLID":
            return ("color", color_literal(paint.get("color"), paint.get("opacity", 1)))
        if paint.get("type") and "GRADIENT" in paint["type"]:
            gradient = gradient_literal(paint)
            if gradient:
                return ("gradient", gradient)
    return None


def border_literal(node):
    for paint in reversed(visible_paints(node.get("strokes"))):
        if paint.get("type") == "SOLID":
            width = node.get("strokeWeight") or 1
            return (
                "Border.all(color: %s, width: %s)"
                % (color_literal(paint.get("color"), paint.get("opacity", 1)), num(width, 2))
            )
    return None


def radius_literal(node):
    radii = node.get("rectangleCornerRadii")
    if radii and len(radii) == 4 and any((value or 0) > 0 for value in radii):
        top_left, top_right, bottom_right, bottom_left = radii
        return (
            "BorderRadius.only(topLeft: Radius.circular(%s), topRight: Radius.circular(%s), "
            "bottomRight: Radius.circular(%s), bottomLeft: Radius.circular(%s))"
            % (num(top_left), num(top_right), num(bottom_right), num(bottom_left))
        )
    radius = node.get("cornerRadius")
    if radius:
        return "BorderRadius.circular(%s)" % num(radius)
    return None


def shadows_literal(node):
    shadows = []
    for effect in node.get("effects") or []:
        if effect.get("visible") is False:
            continue
        if effect.get("type") != "DROP_SHADOW":
            continue
        color = effect.get("color") or {}
        offset = effect.get("offset") or {}
        shadows.append(
            "BoxShadow(color: %s, offset: Offset(%s, %s), blurRadius: %s, spreadRadius: %s)"
            % (
                color_literal(color, color.get("a", 1)),
                num(offset.get("x", 0)),
                num(offset.get("y", 0)),
                num(effect.get("radius", 0)),
                num(effect.get("spread", 0)),
            )
        )
    return shadows


def decoration_literal(node):
    fill = pick_fill(node)
    border = border_literal(node)
    radius = radius_literal(node)
    shadows = shadows_literal(node)
    if not fill and not border and not shadows:
        return None
    parts = []
    if fill:
        if fill[0] == "color":
            parts.append("color: %s" % fill[1])
        else:
            parts.append("gradient: %s" % fill[1])
    else:
        parts.append("color: Colors.transparent")
    if border:
        parts.append("border: %s" % border)
    if radius:
        parts.append("borderRadius: %s" % radius)
    if shadows:
        parts.append("boxShadow: [%s]" % ", ".join(shadows))
    return "BoxDecoration(%s)" % ", ".join(parts)


FONT_MAP = {
    "Inter": "Inter",
    "Plus Jakarta Sans": "PlusJakartaSans",
    "Liberation Mono": "RobotoMono",
    "Nimbus Sans": "Inter",
    "FreeSans": "Inter",
    "Liberation Serif": "NotoSerif",
    "FreeSerif": "NotoSerif",
}


def text_style_literal(node):
    style = node.get("style") or {}
    family = FONT_MAP.get(style.get("fontFamily"), "Inter")
    size = style.get("fontSize") or 14
    weight = int(style.get("fontWeight") or 400)
    weight = max(100, min(900, int(round(weight / 100.0)) * 100))
    color = first_solid(node.get("fills"), "Color(0xFF151C27)")
    parts = [
        "fontFamily: '%s'" % family,
        "fontSize: %s" % num(size),
        "fontWeight: FontWeight.w%d" % weight,
        "color: %s" % color,
    ]
    line_height = style.get("lineHeightPx")
    if line_height and size:
        parts.append("height: %s" % num(line_height / size, 3))
    letter_spacing = style.get("letterSpacing")
    if letter_spacing:
        parts.append("letterSpacing: %s" % num(letter_spacing, 3))
    if style.get("italic") or "Italic" in str(style.get("fontStyle", "")):
        parts.append("fontStyle: FontStyle.italic")
    decoration = style.get("textDecoration")
    if decoration == "UNDERLINE":
        parts.append("decoration: TextDecoration.underline")
    elif decoration == "STRIKETHROUGH":
        parts.append("decoration: TextDecoration.lineThrough")
    return "TextStyle(%s)" % ", ".join(parts)


def text_align_literal(node):
    align = (node.get("style") or {}).get("textAlignHorizontal")
    return {
        "CENTER": "TextAlign.center",
        "RIGHT": "TextAlign.right",
        "JUSTIFIED": "TextAlign.justify",
    }.get(align, "TextAlign.left")


def apply_text_case(value, node):
    case = (node.get("style") or {}).get("textCase")
    if case == "UPPER":
        return value.upper()
    if case == "LOWER":
        return value.lower()
    if case == "TITLE":
        return value.title()
    return value


def is_back_node(name):
    return bool(
        re.search(r"(^|[\s_\-])(back|close|exit|dismiss)([\s_\-]|$)", name or "", re.I)
    )


def relative_box(node, root_box):
    box = node.get("absoluteBoundingBox") or {}
    left = box.get("x", 0) - root_box.get("x", 0)
    top = box.get("y", 0) - root_box.get("y", 0)
    return left, top, box.get("width", 0), box.get("height", 0)


def positioned(inner, left, top, width, height=None):
    width_line = "" if width is None else "\n        width: %s," % num(width)
    height_line = "" if height is None else "\n        height: %s," % num(height)
    return (
        "      Positioned(\n"
        "        left: %s,\n"
        "        top: %s,%s%s\n"
        "        child: %s,\n"
        "      ),"
        % (num(left), num(top), width_line, height_line, inner)
    )


def intersect_rect(a, b):
    if a is None:
        return b
    if b is None:
        return a
    left = max(a[0], b[0])
    top = max(a[1], b[1])
    right = min(a[2], b[2])
    bottom = min(a[3], b[3])
    if right <= left or bottom <= top:
        return None
    return (left, top, right, bottom)


def text_layout(node, root_box, clip_rect):
    style = node.get("style") or {}
    box = node.get("absoluteBoundingBox") or {}
    root_left = root_box.get("x", 0)
    root_top = root_box.get("y", 0)
    box_left = box.get("x", 0)
    box_top = box.get("y", 0)
    box_width = box.get("width", 0)
    box_height = box.get("height", 0)
    box_right = box_left + box_width
    align = style.get("textAlignHorizontal") or "LEFT"
    line_height = style.get("lineHeightPx") or style.get("fontSize") or 14
    text = apply_text_case(node.get("characters") or "", node)
    explicit_lines = text.count("\n") + 1 if text else 1
    expected_lines = max(1, int(round(box_height / line_height))) if line_height else 1
    auto_wrapped = explicit_lines <= 1 and expected_lines > 1
    truncated = style.get("textTruncation") == "ENDING"

    left = box_left - root_left
    top = box_top - root_top
    width = None
    soft_wrap = False
    max_lines = None
    overflow = "TextOverflow.visible"

    if clip_rect is not None:
        visible_left = max(box_left, clip_rect[0])
        visible_right = min(box_right, clip_rect[2])
        width = max(0, visible_right - visible_left)
        if not truncated and not auto_wrapped:
            width = width + 4
        left = visible_left - root_left
        if auto_wrapped:
            soft_wrap = True
            max_lines = expected_lines
            overflow = "TextOverflow.clip"
        else:
            overflow = "TextOverflow.ellipsis" if truncated else "TextOverflow.clip"
        if truncated:
            max_lines = 1
    elif auto_wrapped:
        width = box_width
        soft_wrap = True
        max_lines = expected_lines
        overflow = "TextOverflow.clip"
        if align == "CENTER":
            left = box_left + box_width / 2 - width / 2 - root_left
        elif align == "RIGHT":
            left = box_right - width - root_left
    elif truncated:
        width = box_width
        max_lines = 1
        overflow = "TextOverflow.ellipsis"
    elif align in ("CENTER", "RIGHT"):
        width = max(box_width * 2, 600)
        if align == "CENTER":
            left = box_left + box_width / 2 - width / 2 - root_left
        else:
            left = box_right - width - root_left

    return left, top, width, soft_wrap, max_lines, overflow


def build_widgets(frame, asset_paths):
    root_box = frame.get("absoluteBoundingBox") or {}
    widgets = []
    used_assets = set()

    def add_back_overlay(node):
        box = node.get("absoluteBoundingBox") or {}
        left, top, width, height = relative_box(node, root_box)
        if width <= 0 or height <= 0:
            return
        widgets.append(
            positioned(
                "GestureDetector(behavior: HitTestBehavior.opaque, "
                "onTap: () => Navigator.of(context).maybePop())",
                left,
                top,
                width,
                height,
            )
        )

    def process(node, clip_rect=None, is_root=False):
        if node.get("visible") is False:
            return
        opacity = node.get("opacity", 1)
        if opacity is not None and opacity <= 0.001:
            return
        box = node.get("absoluteBoundingBox") or {}
        width = box.get("width", 0)
        height = box.get("height", 0)
        if width <= 0 or height <= 0:
            return

        inner = None
        node_type = node.get("type")
        node_id = node.get("id")
        asset_path = asset_paths.get(node_id)
        child_items = node.get("children") or []
        text_left = None
        text_top = None
        text_width = None

        if asset_path:
            used_assets.add(node_id)
            asset_path = asset_path.replace("\\", "/")
            inner = (
                "Image.asset(%s, fit: BoxFit.fill, filterQuality: FilterQuality.high)"
                % dart_string(asset_path)
            )
        elif node_type == "TEXT":
            text = apply_text_case(node.get("characters") or "", node)
            if text:
                (
                    text_left,
                    text_top,
                    text_width,
                    soft_wrap,
                    max_lines,
                    overflow,
                ) = text_layout(node, root_box, clip_rect)
                max_lines_line = (
                    "" if max_lines is None else "\n          maxLines: %d," % max_lines
                )
                inner = (
                    "Text(\n"
                    "          %s,\n"
                    "          softWrap: %s,%s\n"
                    "          overflow: %s,\n"
                    "          textAlign: %s,\n"
                    "          style: %s,\n"
                    "        )"
                    % (
                        dart_string(text),
                        "true" if soft_wrap else "false",
                        max_lines_line,
                        overflow,
                        text_align_literal(node),
                        text_style_literal(node),
                    )
                )
        else:
            decoration = decoration_literal(node)
            if decoration:
                inner = "Container(decoration: %s)" % decoration

        if inner:
            if node_type == "TEXT":
                left, top, render_width, render_height = (
                    text_left,
                    text_top,
                    text_width,
                    None,
                )
            else:
                left, top, _, _ = relative_box(node, root_box)
                render_width = width
                render_height = height
            if opacity is not None and opacity < 0.999:
                inner = "Opacity(opacity: %s, child: %s)" % (num(opacity, 3), inner)
            widgets.append(positioned(inner, left, top, render_width, render_height))

        child_clip = clip_rect
        if not is_root and node.get("clipsContent"):
            node_rect = (
                box.get("x", 0),
                box.get("y", 0),
                box.get("x", 0) + width,
                box.get("y", 0) + height,
            )
            child_clip = intersect_rect(clip_rect, node_rect)

        for child in child_items:
            process(child, child_clip)

        if is_back_node(node.get("name")) or is_back_node(node.get("id")):
            add_back_overlay(node)

    process(frame, is_root=True)
    return widgets, used_assets


def build_screen(screen, screen_by_number, all_screens):
    frame = json.loads(open(screen["nodeFile"], encoding="utf-8").read())
    asset_paths = screen.get("assetPaths") or {}
    widgets, used_assets = build_widgets(frame, asset_paths)
    number = screen["number"]
    name = screen["name"]
    class_name = "S%d%sScreen" % (number, pascal(name))
    route_name = "/s%d_%s" % (number, slug(name))

    previous_route = OLD_SCREEN_BY_NUMBER.get(number - 1)
    if number - 1 in screen_by_number:
        previous_route = screen_by_number[number - 1]["routeName"]
    next_route = screen_by_number.get(number + 1, {}).get("routeName")

    background = first_solid(frame.get("fills"), "Colors.white")
    body = "\n".join(widgets) if widgets else ""
    body_block = (
        "Stack(\n        clipBehavior: Clip.none,\n        children: [\n%s\n        ],\n      )"
        % body
    )

    code = (
        "import 'package:flutter/material.dart';\n\n"
        "import '../widgets/figma_screen.dart';\n\n"
        "class %s extends StatelessWidget {\n"
        "  const %s({super.key});\n\n"
        "  static const routeName = %s;\n\n"
        "  @override\n"
        "  Widget build(BuildContext context) {\n"
        "    return FigmaScreen(\n"
        "      width: %s,\n"
        "      height: %s,\n"
        "      background: %s,\n"
        "      screenCode: '%s',\n"
        "      previousRoute: %s,\n"
        "      nextRoute: %s,\n"
        "      child: %s,\n"
        "    );\n"
        "  }\n"
        "}\n"
        % (
            class_name,
            class_name,
            dart_string(route_name),
            num(screen["width"]),
            num(screen["height"]),
            background,
            screen["code"],
            dart_string(previous_route) if previous_route else "null",
            dart_string(next_route) if next_route else "null",
            body_block,
        )
    )
    filename = "s%d_%s.dart" % (number, slug(name))
    with open(os.path.join(SCREENS_DIR, filename), "w", encoding="utf-8") as handle:
        handle.write(code)
    return {
        "class": class_name,
        "route": route_name,
        "file": filename,
    }


def main():
    os.makedirs(SCREENS_DIR, exist_ok=True)
    manifest = json.load(open(MANIFEST_FILE, encoding="utf-8"))
    screens = sorted(manifest["screens"], key=lambda item: item["number"])
    for screen in screens:
        screen["routeName"] = "/s%d_%s" % (screen["number"], slug(screen["name"]))
    screen_by_number = {screen["number"]: screen for screen in screens}

    generated = []
    for screen in screens:
        generated.append(build_screen(screen, screen_by_number, screens))
        print("generated", screen["code"], screen["name"], flush=True)

    imports = "\n".join(
        "import 'screens/%s';" % item["file"] for item in generated
    )
    entries = "\n".join(
        "  '%s': (context) => const %s()," % (item["route"], item["class"])
        for item in generated
    )
    routes_code = (
        "import 'package:flutter/material.dart';\n\n"
        "%s\n\n"
        "final Map<String, WidgetBuilder> s49S96Routes = {\n"
        "%s\n"
        "};\n" % (imports, entries)
    )
    with open(ROUTES_FILE, "w", encoding="utf-8") as handle:
        handle.write(routes_code)
    print("wrote", ROUTES_FILE, flush=True)


if __name__ == "__main__":
    main()
