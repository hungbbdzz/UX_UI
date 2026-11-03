import json
import os
import re

cache_path = os.path.join("final", "figmatoCode", "cache", "JLX8cowZyXR6OiJLPTvCbh.json")

print("Loading cached Figma JSON...")
with open(cache_path, "r", encoding="utf-8") as f:
    doc = json.load(f)

pages = doc.get("document", {}).get("children", [])

target_page_ids = ["11:4", "21:7915"]
target_pages = [p for p in pages if p.get("id") in target_page_ids]

print(f"Found {len(target_pages)} target pages: {[p.get('name') for p in target_pages]}")

# Map all frame IDs to names
frame_map = {}
for p in target_pages:
    for node in p.get("children", []):
        frame_map[node.get("id")] = {
            "name": node.get("name"),
            "page": p.get("name"),
            "width": (node.get("absoluteBoundingBox") or {}).get("width", 0),
            "height": (node.get("absoluteBoundingBox") or {}).get("height", 0)
        }

print(f"Total screens indexed in Part A & B: {len(frame_map)}")

# Scan for prototype links / transitionNodeID / interactions
interactions_found = []

def scan_interactions(node, current_frame_id):
    node_id = node.get("id")
    node_name = node.get("name")
    
    # 1. transitionNodeID
    trans_dest = node.get("transitionNodeID")
    if trans_dest:
        dest_info = frame_map.get(trans_dest, {"name": trans_dest})
        interactions_found.append({
            "from_frame": frame_map.get(current_frame_id, {}).get("name", current_frame_id),
            "from_layer": node_name,
            "to_frame": dest_info.get("name"),
            "to_id": trans_dest,
            "trigger": "ON_CLICK",
            "type": "transitionNodeID"
        })

    # 2. interactions array
    for inter in node.get("interactions", []):
        trig = inter.get("trigger", {}).get("type", "ON_CLICK")
        for act in inter.get("actions", []):
            dest_id = act.get("destinationId")
            if dest_id:
                dest_info = frame_map.get(dest_id, {"name": dest_id})
                interactions_found.append({
                    "from_frame": frame_map.get(current_frame_id, {}).get("name", current_frame_id),
                    "from_layer": node_name,
                    "to_frame": dest_info.get("name"),
                    "to_id": dest_id,
                    "trigger": trig,
                    "type": act.get("type"),
                    "navigation": act.get("navigation")
                })
                
    for ch in node.get("children", []):
        scan_interactions(ch, current_frame_id)

for p in target_pages:
    for frame in p.get("children", []):
        scan_interactions(frame, frame.get("id"))

print(f"\n>> TOTAL PROTOTYPE INTERACTIONS FOUND: {len(interactions_found)}")
print("Sample interactions:")
for it in interactions_found[:20]:
    print(f"  [{it['from_frame']}] Layer '{it['from_layer']}' --({it['trigger']})--> [{it['to_frame']}]")

if len(interactions_found) > 20:
    print(f"  ... and {len(interactions_found) - 20} more interactions.")

