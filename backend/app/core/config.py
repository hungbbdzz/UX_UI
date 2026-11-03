# -*- coding: utf-8 -*-
"""
EduPath Backend - Cấu hình hệ thống (Settings)
Phục vụ môn Thiết kế UX/UI - Nhóm Rise (VKU)
Giảng viên hướng dẫn: ThS. Lý Quỳnh Trân
"""

import os
from pydantic import BaseModel

class Settings(BaseModel):
    PROJECT_NAME: str = "EduPath E-Learning Platform API"
    VERSION: str = "2.0.0"
    API_V1_STR: str = "/api/v1"
    DESCRIPTION: str = (
        "Hệ thống Backend RESTful API phục vụ nền tảng học tập EduPath (50 Màn hình Phần A & B). "
        "Xây dựng bằng FastAPI, SQLAlchemy 2.0 và SQLite cho đồ án UX/UI - Giảng viên: ThS. Lý Quỳnh Trân."
    )
    
    # Bảo mật JWT
    SECRET_KEY: str = os.getenv("SECRET_KEY", "edupath-rise-vku-secret-key-2026-ly-quynh-tran-secured")
    ALGORITHM: str = "HS256"
    ACCESS_TOKEN_EXPIRE_MINUTES: int = 60 * 24 * 7  # 7 ngày
    
    # Cơ sở dữ liệu SQLite
    BASE_DIR: str = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
    DB_PATH: str = os.path.join(BASE_DIR, "edupath.db")
    SQLALCHEMY_DATABASE_URL: str = f"sqlite:///{DB_PATH}"

settings = Settings()
