# -*- coding: utf-8 -*-
"""
Cấu hình kết nối Figma API và Trích xuất mã nguồn.
"""

import os

ROOT_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

FIGMA_ACCESS_TOKEN = os.getenv("FIGMA_ACCESS_TOKEN", "YOUR_FIGMA_ACCESS_TOKEN")
FIGMA_FILE_KEY = os.getenv("FIGMA_FILE_KEY", "JLX8cowZyXR6OiJLPTvCbh")

OUTPUT_DIR = os.path.join(ROOT_DIR, "output")
CACHE_DIR = os.path.join(ROOT_DIR, "cache")
WEB_VIEWER_DIR = os.path.join(ROOT_DIR, "frontend", "web_viewer")
FLUTTER_DIR = os.path.join(ROOT_DIR, "frontend", "flutter")

EXPORT_FORMATS = ["flutter", "react_native", "html_tailwind"]

