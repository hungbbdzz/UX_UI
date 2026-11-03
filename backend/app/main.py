# -*- coding: utf-8 -*-
"""
=============================================================================
EDUPATH BACKEND API ENGINE (FASTAPI + SQLALCHEMY 2.0 + SQLITE)
=============================================================================
Đồ án môn học: Thiết kế UX/UI (1)_TA - Trường ĐH CNTT & TT Việt - Hàn (VKU)
Giảng viên hướng dẫn: ThS. Lý Quỳnh Trân (lqtran@vku.udn.vn)
Nhóm thực hiện: Nhóm Rise
Thành viên phụ trách Phần A & B:
  1. Nguyễn Văn Hùng - 23IT.B069 (Phần A: S01–S24 + A01, A02)
  2. Nguyễn Gia Minh - 23IT.B132 (Phần B: S25–S48)
=============================================================================
"""

from contextlib import asynccontextmanager
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.core.config import settings
from app.core.database import engine, Base, SessionLocal
import app.models  # Nạp toàn bộ models để Base.metadata nhận diện
from app.api.v1 import api_router
from app.database.seed_data import seed_database

def init_db():
    """Khởi tạo bảng và nạp dữ liệu mẫu ban đầu"""
    Base.metadata.create_all(bind=engine)
    db = SessionLocal()
    try:
        seed_database(db)
    finally:
        db.close()

# Tự động khởi tạo ngay khi nạp module
init_db()

@asynccontextmanager
async def lifespan(app: FastAPI):
    """Quản lý vòng đời ứng dụng khi chạy qua Uvicorn"""
    print("=" * 70)
    print("🚀 KHỞI ĐỘNG HỆ THỐNG EDUPATH BACKEND (NHÓM RISE - VKU)")
    print(f"📌 Giảng viên hướng dẫn: ThS. Lý Quỳnh Trân")
    print(f"📌 Phiên bản API: {settings.VERSION}")
    print("=" * 70)
    init_db()
    print("✅ Hệ thống đã sẵn sàng phục vụ tại: http://127.0.0.1:8000")
    print("📖 Tài liệu Swagger UI tương tác:   http://127.0.0.1:8000/docs")
    print("=" * 70)
    yield
    print("🛑 Đang đóng kết nối Backend...")

app = FastAPI(
    title=settings.PROJECT_NAME,
    version=settings.VERSION,
    description=settings.DESCRIPTION,
    docs_url="/docs",
    redoc_url="/redoc",
    lifespan=lifespan
)

# Cấu hình CORS mở rộng cho Flutter, React Native, Vite và Web Simulator
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Gắn toàn bộ Routers API v1
app.include_router(api_router, prefix=settings.API_V1_STR)

@app.get("/", tags=["Hệ thống"])
def root_status():
    """Thông tin tổng quan hệ thống và đồ án môn học"""
    return {
        "project": "EduPath - AI Learning Experience Platform",
        "institution": "Trường ĐH Công nghệ Thông tin & Truyền thông Việt - Hàn (VKU)",
        "instructor": "ThS. Lý Quỳnh Trân",
        "group": "Nhóm Rise",
        "members": {
            "Part A (S01–S24)": "Nguyễn Văn Hùng (23IT.B069)",
            "Part B (S25–S48)": "Nguyễn Gia Minh (23IT.B132)"
        },
        "status": "ONLINE",
        "swagger_docs": "/docs",
        "version": settings.VERSION
    }

@app.get("/health", tags=["Hệ thống"])
def health_check():
    """Kiểm tra tình trạng hoạt động của máy chủ (Healthcheck)"""
    return {"status": "healthy", "database": "SQLite 3 Connected"}
