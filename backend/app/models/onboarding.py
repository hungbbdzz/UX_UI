# -*- coding: utf-8 -*-
"""
EduPath Backend - Mô hình dữ liệu Onboarding & Khảo sát đầu vào
Hỗ trợ màn hình: S03, S04, S05, S06, S07, S08, S09
"""

from sqlalchemy import Column, Integer, String, Text, JSON, ForeignKey
from app.core.database import Base

class LearningGoal(Base):
    __tablename__ = "learning_goals"

    id = Column(Integer, primary_key=True, index=True)
    code = Column(String(50), unique=True, index=True)
    title = Column(String(255), nullable=False)
    description = Column(Text)
    icon = Column(String(100), default="target")
    popularity_rank = Column(Integer, default=1)


class Interest(Base):
    __tablename__ = "interests"

    id = Column(Integer, primary_key=True, index=True)
    code = Column(String(50), unique=True, index=True)
    name = Column(String(100), nullable=False)
    category = Column(String(100), default="Technology")
    icon = Column(String(100), default="code")
    badge_color = Column(String(50), default="#4F46E5")


class PlacementQuestion(Base):
    __tablename__ = "placement_questions"

    id = Column(Integer, primary_key=True, index=True)
    category = Column(String(100), default="General IT & UX")
    question_text = Column(Text, nullable=False)
    options = Column(JSON, nullable=False)  # List of 4 options
    correct_option_index = Column(Integer, nullable=False)
    explanation = Column(Text)
    difficulty_level = Column(String(50), default="Medium")  # Easy, Medium, Hard


class SuggestedPath(Base):
    __tablename__ = "suggested_paths"

    id = Column(Integer, primary_key=True, index=True)
    title = Column(String(255), nullable=False)
    target_role = Column(String(100), nullable=False)
    total_weeks = Column(Integer, default=12)
    description = Column(Text)
    milestones = Column(JSON, nullable=False)  # List of milestones: phase, duration, courses, skills
    match_score = Column(Integer, default=95)  # % phù hợp dựa trên bài test S08


class UserOnboardingState(Base):
    __tablename__ = "user_onboarding_states"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"), unique=True, nullable=False)
    selected_goal_code = Column(String(50))
    selected_interests = Column(JSON)  # List of interest codes
    selected_level = Column(String(50), default="Beginner")
    daily_study_minutes = Column(Integer, default=30)
    placement_score = Column(Integer, default=0)
    placement_rank = Column(String(50), default="B1 - Intermediate")
    suggested_path_id = Column(Integer, ForeignKey("suggested_paths.id"), nullable=True)

