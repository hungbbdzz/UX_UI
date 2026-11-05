# -*- coding: utf-8 -*-
import os
import re

screens_dir = r"c:\Documents\Materials\UX UI\final\figmatoCode\frontend\flutter\lib\screens"
routes_file = r"c:\Documents\Materials\UX UI\final\figmatoCode\frontend\flutter\lib\routes.dart"
routes_s49_file = r"c:\Documents\Materials\UX UI\final\figmatoCode\frontend\flutter\lib\routes_s49_s96.dart"

reg_routes = set()
for rf in [routes_file, routes_s49_file]:
    with open(rf, "r", encoding="utf-8") as f:
        content = f.read()
    for m in re.finditer(r"'(/[^ ']+)'\s*:", content):
        reg_routes.add(m.group(1))

print(f"Total registered routes in definitions: {len(reg_routes)}")

# Scan all Navigator.pushNamed calls in screen files
missing = {}
total_calls = 0
for fn in os.listdir(screens_dir):
    if not fn.endswith(".dart"):
        continue
    with open(os.path.join(screens_dir, fn), "r", encoding="utf-8") as f:
        content = f.read()
    for m in re.finditer(r"Navigator\.pushNamed\s*\(\s*context\s*,\s*['\"]([^'\"]+)['\"]\s*\)", content):
        target = m.group(1)
        total_calls += 1
        if target not in reg_routes:
            if target not in missing:
                missing[target] = []
            missing[target].append(fn)

print(f"Total navigation calls in screens: {total_calls}")
print(f"Total missing routes: {len(missing)}")
for r, files in sorted(missing.items()):
    print(f"  MISSING: '{r}' -> called in {len(files)} screens: {files[:3]}")

