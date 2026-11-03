# -*- coding: utf-8 -*-
"""
Tải ảnh render độ phân giải cao (2x PNG) của tất cả 50 màn hình từ Figma API.
"""

import os
import json
import urllib.request
from config import FIGMA_ACCESS_TOKEN, FIGMA_FILE_KEY, OUTPUT_DIR

IMAGES_DIR = os.path.join(OUTPUT_DIR, "images")
os.makedirs(IMAGES_DIR, exist_ok=True)

# Đọc danh sách màn hình từ prototype_graph.json
proto_file = os.path.join(OUTPUT_DIR, "prototype_graph.json")
if not os.path.exists(proto_file):
    print("[!] Chưa có file prototype_graph.json. Vui lòng chạy extract_figma.py trước.")
    exit(1)

with open(proto_file, "r", encoding="utf-8") as f:
    data = json.load(f)

screens = data.get("screens", [])
print(f"[*] Tìm thấy {len(screens)} màn hình cần tải ảnh render từ Figma...")

# Gom nhóm tối đa 25 nodes mỗi batch để request nhanh & ổn định
batch_size = 25
headers = {"X-Figma-Token": FIGMA_ACCESS_TOKEN}

for i in range(0, len(screens), batch_size):
    batch = screens[i:i+batch_size]
    node_ids = [sc["id"] for sc in batch]
    id_to_sc = {sc["id"]: sc for sc in batch}
    ids_param = ",".join(node_ids)
    
    url = f"https://api.figma.com/v1/images/{FIGMA_FILE_KEY}?ids={ids_param}&format=png&scale=2"
    print(f"[*] Đang yêu cầu URL render cho batch {i//batch_size + 1} ({len(node_ids)} màn hình)...")
    
    req = urllib.request.Request(url, headers=headers)
    try:
        with urllib.request.urlopen(req, timeout=45) as resp:
            res_data = json.loads(resp.read().decode('utf-8'))
            images_map = res_data.get("images", {})
            
            for node_id, img_url in images_map.items():
                if not img_url:
                    continue
                sc = id_to_sc.get(node_id)
                clean_name = sc["pascal_name"] if sc else node_id.replace(":", "_")
                img_path = os.path.join(IMAGES_DIR, f"{clean_name}.png")
                
                print(f"    -> Đang tải ảnh {clean_name}.png...")
                with urllib.request.urlopen(img_url, timeout=30) as img_resp:
                    with open(img_path, "wb") as f_out:
                        f_out.write(img_resp.read())
                        
    except Exception as e:
        print(f"[!] Lỗi khi tải batch {i}: {e}")

print(f"\n[V] Đã hoàn tất tải ảnh render Figma vào: {IMAGES_DIR}")

