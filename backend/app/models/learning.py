# -*- coding: utf-8 -*-
"""
EduPath Backend - Mô hình dữ liệu Học tập Đa phương tiện & Ghi chú
Hỗ trợ màn hình: S36, S37, S38, S39, S40, S41, S42, S43, S44
"""

from datetime import datetime, timezone
from sqlalchemy import Column, Integer, String, Text, Boolean, DateTime, ForeignKey, Float
from sqlalchemy.orm import relationship

from app.core.database import Base

class UserLessonProgress(Base):
    __tablename__ = "user_lesson_progress"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"), nullable=False)
    lesson_id = Column(Integer, ForeignKey("lessons.id"), nullable=False)
    course_id = Column(Integer, ForeignKey("courses.id"), nullable=False)
    
    is_completed = Column(Boolean, default=False)
    playback_position_seconds = Column(Integer, default=0)
    total_duration_seconds = Column(Integer, default=600)
    last_accessed_at = Column(DateTime, default=lambda: datetime.now(timezone.utc))

    user = relationship("User", back_populates="progress_records")


class TimestampedNote(Base):
    __tablename__ = "timestamped_notes"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"), nullable=False)
    lesson_id = Column(Integer, ForeignKey("lessons.id"), nullable=False)
    timestamp_seconds = Column(Integer, default=120)  # Ví dụ 02:00
    note_text = Column(Text, nullable=False)
    created_at = Column(DateTime, default=lambda: datetime.now(timezone.utc))

    user = relationship("User", back_populates="notes")


class GlossaryTerm(Base):
    __tablename__ = "glossary_terms"

    id = Column(Integer, primary_key=True, index=True)
    term = Column(String(100), unique=True, index=True, nullable=False)
    category = Column(String(50), default="UX/UI Design")
    definition = Column(Text, nullable=False)
    vietnamese_translation = Column(String(255))
    example_usage = Column(Text)


class OfflineDownload(Base):
    __tablename__ = "offline_downloads"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"), nullable=False)
    lesson_id = Column(Integer, ForeignKey("lessons.id"), nullable=False)
    course_id = Column(Integer, ForeignKey("courses.id"), nullable=False)
    file_size_mb = Column(Float, default=45.2)
    download_status = Column(String(50), default="completed")  # queued, downloading, completed
    downloaded_at = Column(DateTime, default=lambda: datetime.now(timezone.utc))


class FocusSession(Base):
    __tablename__ = "focus_sessions"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"), nullable=False)
    session_minutes = Column(Integer, default=25)  # Pomodoro
    completed = Column(Boolean, default=True)
    completed_at = Column(DateTime, default=lambda: datetime.now(timezone.utc))

