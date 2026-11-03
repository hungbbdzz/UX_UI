# -*- coding: utf-8 -*-
"""
EduPath Backend - Cấu hình Cơ sở dữ liệu SQLAlchemy 2.0
"""

from sqlalchemy import create_engine
from sqlalchemy.orm import declarative_base, sessionmaker

from app.core.config import settings

# SQLite yêu cầu connect_args check_same_thread=False cho đa luồng FastAPI
engine = create_engine(
    settings.SQLALCHEMY_DATABASE_URL,
    connect_args={"check_same_thread": False},
    echo=False
)

SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()

def get_db():
    """Dependency cung cấp session CSDL cho từng HTTP Request"""
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
