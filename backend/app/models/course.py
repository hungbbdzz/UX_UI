# -*- coding: utf-8 -*-
"""
EduPath Backend - Mô hình dữ liệu Khóa học & Giảng viên (Courses & Instructors)
Hỗ trợ màn hình: S25, S26, S27, S28, S29, S30, S31, S32, S33, S34, S35
"""

from datetime import datetime, timezone
from sqlalchemy import Column, Integer, String, Text, Boolean, DateTime, ForeignKey, Float, JSON
from sqlalchemy.orm import relationship

from app.core.database import Base

class Category(Base):
    __tablename__ = "categories"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(100), unique=True, nullable=False)
    slug = Column(String(100), unique=True, index=True)
    icon = Column(String(50), default="folder")
    color = Column(String(50), default="#4F46E5")
    courses_count = Column(Integer, default=0)
    is_featured = Column(Boolean, default=True)

    courses = relationship("Course", back_populates="category")


class Instructor(Base):
    __tablename__ = "instructors"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(150), nullable=False)  # "Ms. Lan", "Dr. Anh Tuan"
    title = Column(String(150), default="Senior UI/UX & Data Specialist")
    organization = Column(String(150), default="Tech Academy & Innovation Hub")
    avatar_url = Column(String(500), default="https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=200")
    bio = Column(Text, default="Hơn 8 năm kinh nghiệm giảng dạy và dẫn dắt các dự án công nghệ lớn.")
    total_students = Column(Integer, default=14200)
    average_rating = Column(Float, default=4.9)
    total_courses = Column(Integer, default=6)

    courses = relationship("Course", back_populates="instructor")


class Course(Base):
    __tablename__ = "courses"

    id = Column(Integer, primary_key=True, index=True)
    title = Column(String(255), nullable=False)  # "Applied Data Wrangling with Pandas", "Product Design Thinking & Systems"
    slug = Column(String(255), unique=True, index=True)
    category_id = Column(Integer, ForeignKey("categories.id"), nullable=False)
    instructor_id = Column(Integer, ForeignKey("instructors.id"), nullable=False)
    thumbnail_url = Column(String(500), default="https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=600")
    
    price = Column(Integer, default=0)  # 0: Free, 299000, 499000
    original_price = Column(Integer, default=599000)
    is_free = Column(Boolean, default=False)
    
    level = Column(String(50), default="All Levels")  # Beginner, Intermediate, Advanced, All Levels
    duration_hours = Column(Float, default=4.5)
    total_lessons = Column(Integer, default=28)
    rating = Column(Float, default=4.9)
    reviews_count = Column(Integer, default=1280)
    students_enrolled = Column(Integer, default=3850)
    
    description = Column(Text)
    what_you_will_learn = Column(JSON)  # List of learning outcomes
    requirements = Column(JSON)  # List of prerequisites
    
    is_featured = Column(Boolean, default=False)
    is_trending = Column(Boolean, default=False)
    created_at = Column(DateTime, default=lambda: datetime.now(timezone.utc))

    # Relationships
    category = relationship("Category", back_populates="courses")
    instructor = relationship("Instructor", back_populates="courses")
    sections = relationship("CourseSection", back_populates="course", cascade="all, delete-orphan", order_by="CourseSection.order_index")
    reviews = relationship("CourseReview", back_populates="course", cascade="all, delete-orphan")
    enrollments = relationship("CourseEnrollment", back_populates="course", cascade="all, delete-orphan")


class CourseSection(Base):
    __tablename__ = "course_sections"

    id = Column(Integer, primary_key=True, index=True)
    course_id = Column(Integer, ForeignKey("courses.id"), nullable=False)
    title = Column(String(255), nullable=False)
    order_index = Column(Integer, default=1)

    course = relationship("Course", back_populates="sections")
    lessons = relationship("Lesson", back_populates="section", cascade="all, delete-orphan", order_by="Lesson.order_index")


class Lesson(Base):
    __tablename__ = "lessons"

    id = Column(Integer, primary_key=True, index=True)
    section_id = Column(Integer, ForeignKey("course_sections.id"), nullable=False)
    title = Column(String(255), nullable=False)
    lesson_type = Column(String(50), default="video")  # video, audio, reading, slide
    duration_minutes = Column(Integer, default=10)
    
    video_url = Column(String(500), default="https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")
    audio_url = Column(String(500), default="https://example.com/audio/sample_lesson.mp3")
    reading_content = Column(Text, default="# Giới thiệu bài học\n\nNội dung chi tiết về kỹ thuật...")
    slide_url = Column(String(500), default="https://example.com/slides/chapter1.pdf")
    
    is_preview = Column(Boolean, default=False)  # S35 - Preview miễn phí
    order_index = Column(Integer, default=1)

    section = relationship("CourseSection", back_populates="lessons")


class CourseReview(Base):
    __tablename__ = "course_reviews"

    id = Column(Integer, primary_key=True, index=True)
    course_id = Column(Integer, ForeignKey("courses.id"), nullable=False)
    user_id = Column(Integer, ForeignKey("users.id"), nullable=False)
    user_name = Column(String(150), default="Nguyễn Văn Hùng")
    user_avatar = Column(String(500), default="https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=200")
    rating = Column(Integer, default=5)
    comment = Column(Text, nullable=False)
    created_at = Column(DateTime, default=lambda: datetime.now(timezone.utc))

    course = relationship("Course", back_populates="reviews")

