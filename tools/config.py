# -*- coding: utf-8 -*-
"""
Cấu hình kết nối Figma API và Trích xuất mã nguồn.
"""

import os

FIGMA_ACCESS_TOKEN = os.getenv("FIGMA_ACCESS_TOKEN", "YOUR_FIGMA_ACCESS_TOKEN")
FIGMA_FILE_KEY = os.getenv("FIGMA_FILE_KEY", "JLX8cowZyXR6OiJLPTvCbh")

OUTPUT_DIR = os.path.join(os.path.dirname(__file__), "output")
CACHE_DIR = os.path.join(os.path.dirname(__file__), "cache")

EXPORT_FORMATS = ["flutter", "react_native", "html_tailwind"]
