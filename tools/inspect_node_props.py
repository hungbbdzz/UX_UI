import json
import os

cache_path = os.path.join("final", "figmatoCode", "cache", "JLX8cowZyXR6OiJLPTvCbh.json")

with open(cache_path, "r", encoding="utf-8") as f:
    doc = json.load(f)

pages = doc.get("document", {}).get("children", [])
page1 = [p for p in pages if p.get("id") == "11:4"][0]

sample_frame = page1.get("children", [])[1] # e.g. S03
print(f"Sample Frame: '{sample_frame.get('name')}' ({sample_frame.get('id')})")
print(f"  layoutMode: {sample_frame.get('layoutMode')}")
print(f"  itemSpacing: {sample_frame.get('itemSpacing')}")
print(f"  padding: L={sample_frame.get('paddingLeft')}, R={sample_frame.get('paddingRight')}, T={sample_frame.get('paddingTop')}, B={sample_frame.get('paddingBottom')}")
print(f"  fills: {sample_frame.get('fills')}")
print(f"  children count: {len(sample_frame.get('children', []))}")
for ch in sample_frame.get("children", [])[:8]:
    print(f"    - [{ch.get('type')}] '{ch.get('name')}': layoutMode={ch.get('layoutMode')}, box={ch.get('absoluteBoundingBox')}")

