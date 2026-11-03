# -*- coding: utf-8 -*-
"""
EduPath Backend - Mô hình dữ liệu Gamification & Học tập
Hỗ trợ màn hình: S10, S11, S12, S13, S14, S15, S16, S17, S20, S21
"""

from datetime import datetime, date, timezone
from sqlalchemy import Column, Integer, String, Text, Boolean, Date, DateTime, ForeignKey, Float, JSON
from app.core.database import Base

class DailyQuest(Base):
    __tablename__ = "daily_quests"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"), nullable=False)
    title = Column(String(255), nullable=False)  # "Study for 20 mins", "Complete 1 Quiz", "Take 1 Lesson Note"
    quest_type = Column(String(50), default="study_time")  # study_time, quiz, notes, streak
    target_value = Column(Integer, default=20)
    current_value = Column(Integer, default=20)
    reward_xp = Column(Integer, default=50)
    is_completed = Column(Boolean, default=False)
    is_claimed = Column(Boolean, default=False)
    icon = Column(String(50), default="menu_book")
    quest_date = Column(Date, default=date.today)


class StudyPlanItem(Base):
    __tablename__ = "study_plan_items"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"), nullable=False)
    course_title = Column(String(255), nullable=False)
    lesson_title = Column(String(255), nullable=False)
    duration_minutes = Column(Integer, default=15)
    is_completed = Column(Boolean, default=False)
    scheduled_date = Column(Date, default=date.today)
    order_index = Column(Integer, default=1)


class StudyStreakLog(Base):
    __tablename__ = "study_streak_logs"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"), nullable=False)
    log_date = Column(Date, nullable=False)
    minutes_studied = Column(Integer, default=0)
    is_active_day = Column(Boolean, default=True)
    used_freeze = Column(Boolean, default=False)


class WeeklyGoalLog(Base):
    __tablename__ = "weekly_goal_logs"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"), nullable=False)
    week_number = Column(Integer, default=1)
    target_hours = Column(Float, default=7.0)
    completed_hours = Column(Float, default=5.5)
    daily_breakdown = Column(JSON)  # {"Mon": 1.2, "Tue": 0.8, "Wed": 1.5, ...}


class Badge(Base):
    __tablename__ = "badges"

    id = Column(Integer, primary_key=True, index=True)
    code = Column(String(50), unique=True, index=True)
    name = Column(String(100), nullable=False)
    description = Column(Text)
    category = Column(String(50), default="Streak")  # Streak, Course, Speed, Community
    icon = Column(String(100), default="military_tech")
    rarity = Column(String(50), default="Gold")  # Bronze, Silver, Gold, Diamond
    xp_bonus = Column(Integer, default=100)


class UserBadge(Base):
    __tablename__ = "user_badges"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"), nullable=False)
    badge_id = Column(Integer, ForeignKey("badges.id"), nullable=False)
    is_unlocked = Column(Boolean, default=False)
    unlocked_at = Column(DateTime, nullable=True)


class SkillNode(Base):
    __tablename__ = "skill_nodes"

    id = Column(Integer, primary_key=True, index=True)
    title = Column(String(100), nullable=False)
    category = Column(String(50), nullable=False)  # "Design", "Frontend", "Backend", "Data"
    level = Column(Integer, default=1)
    max_level = Column(Integer, default=5)
    current_points = Column(Integer, default=3)
    max_points = Column(Integer, default=5)
    status = Column(String(50), default="in_progress")  # locked, in_progress, mastered
    icon = Column(String(50), default="star")
    parent_id = Column(Integer, ForeignKey("skill_nodes.id"), nullable=True)
