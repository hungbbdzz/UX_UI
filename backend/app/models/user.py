# -*- coding: utf-8 -*-
"""
EduPath Backend - Mô hình dữ liệu Người dùng & Hồ sơ (User & Profile)
Hỗ trợ màn hình: A01, A02, S18, S19, S22, S23, S24
"""

from datetime import datetime, timezone
from sqlalchemy import Column, Integer, String, Boolean, DateTime, ForeignKey, Float, Text
from sqlalchemy.orm import relationship

from app.core.database import Base

class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    email = Column(String(255), unique=True, index=True, nullable=False)
    full_name = Column(String(255), nullable=False)
    hashed_password = Column(String(255), nullable=False)
    role = Column(String(50), default="learner")  # learner, instructor, admin
    is_active = Column(Boolean, default=True)
    created_at = Column(DateTime, default=lambda: datetime.now(timezone.utc))

    # Relationships
    profile = relationship("LearnerProfile", back_populates="user", uselist=False, cascade="all, delete-orphan")
    settings = relationship("UserSettings", back_populates="user", uselist=False, cascade="all, delete-orphan")
    enrollments = relationship("CourseEnrollment", back_populates="user", cascade="all, delete-orphan")
    progress_records = relationship("UserLessonProgress", back_populates="user", cascade="all, delete-orphan")
    notes = relationship("TimestampedNote", back_populates="user", cascade="all, delete-orphan")
    certificates = relationship("Certificate", back_populates="user", cascade="all, delete-orphan")


class LearnerProfile(Base):
    __tablename__ = "learner_profiles"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"), unique=True, nullable=False)
    avatar_url = Column(String(500), default="https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=200")
    bio = Column(Text, default="Học viên đam mê công nghệ & thiết kế sản phẩm UX/UI")
    phone = Column(String(50), default="0905123456")
    current_level = Column(String(50), default="Intermediate")  # Beginner, Intermediate, Advanced
    daily_study_minutes = Column(Integer, default=30)
    
    # Gamification stats (S10, S12, S14, S16)
    xp = Column(Integer, default=1250)
    level = Column(Integer, default=5)
    streak_count = Column(Integer, default=12)
    longest_streak = Column(Integer, default=24)
    freeze_streak_count = Column(Integer, default=2)
    total_study_hours = Column(Float, default=48.5)
    courses_completed = Column(Integer, default=3)
    certificates_count = Column(Integer, default=2)

    user = relationship("User", back_populates="profile")


class UserSettings(Base):
    __tablename__ = "user_settings"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"), unique=True, nullable=False)
    
    # S22 - Learning settings
    auto_play_video = Column(Boolean, default=True)
    default_subtitles = Column(String(50), default="vi")  # vi, en, none
    playback_speed = Column(Float, default=1.0)
    
    # S23 - Study reminders
    daily_reminder_enabled = Column(Boolean, default=True)
    reminder_time = Column(String(10), default="20:00")
    
    # S24 - Display and accessibility
    dark_mode = Column(Boolean, default=True)
    font_size = Column(String(20), default="medium")  # small, medium, large
    high_contrast = Column(Boolean, default=False)
    reduce_motion = Column(Boolean, default=False)

    user = relationship("User", back_populates="settings")

