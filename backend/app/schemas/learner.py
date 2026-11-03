# -*- coding: utf-8 -*-
"""
EduPath Backend - Pydantic Schemas: Trải nghiệm Học viên & Gamification (S10-S24)
"""

from typing import List, Optional, Dict, Any
from datetime import date
from pydantic import BaseModel

class DailyQuestDTO(BaseModel):
    id: int
    title: str
    quest_type: str
    target_value: int
    current_value: int
    reward_xp: int
    is_completed: bool
    is_claimed: bool
    icon: str

    class Config:
        from_attributes = True

class StudyPlanItemDTO(BaseModel):
    id: int
    course_title: str
    lesson_title: str
    duration_minutes: int
    is_completed: bool
    scheduled_date: date
    order_index: int

    class Config:
        from_attributes = True

class StudyStreakDTO(BaseModel):
    streak_count: int
    longest_streak: int
    freeze_streak_count: int
    active_days_this_month: List[str]  # ["2026-11-01", "2026-11-02", ...]
    freeze_used_dates: List[str]

class WeeklyGoalDTO(BaseModel):
    week_number: int
    target_hours: float
    completed_hours: float
    daily_breakdown: Dict[str, float]  # {"Thứ 2": 1.5, "Thứ 3": 0.8, ...}
    percent_completed: float

class LearningStatisticsDTO(BaseModel):
    total_study_hours: float
    courses_completed: int
    certificates_count: int
    avg_daily_minutes: int
    weekly_trend: List[Dict[str, Any]]
    top_categories: List[Dict[str, Any]]

class BadgeDTO(BaseModel):
    id: int
    code: str
    name: str
    description: str
    category: str
    icon: str
    rarity: str
    xp_bonus: int
    is_unlocked: bool

    class Config:
        from_attributes = True

class LevelXpDTO(BaseModel):
    current_level: int
    current_xp: int
    xp_for_next_level: int
    progress_percent: float
    rank_title: str  # "Nhà Khám Phá Tri Thức"
    leaderboard_rank: int

class LearnerProfileDetailDTO(BaseModel):
    id: int
    user_id: int
    full_name: str
    email: str
    avatar_url: str
    bio: str
    phone: str
    current_level: str
    daily_study_minutes: int
    xp: int
    level: int
    streak_count: int
    total_study_hours: float
    courses_completed: int
    certificates_count: int

    class Config:
        from_attributes = True

class UpdateProfileRequest(BaseModel):
    full_name: Optional[str] = None
    bio: Optional[str] = None
    phone: Optional[str] = None
    avatar_url: Optional[str] = None
    daily_study_minutes: Optional[int] = None

class SkillNodeDTO(BaseModel):
    id: int
    title: str
    category: str
    level: int
    max_level: int
    current_points: int
    max_points: int
    status: str
    icon: str
    parent_id: Optional[int] = None

    class Config:
        from_attributes = True

class UserSettingsDTO(BaseModel):
    auto_play_video: bool
    default_subtitles: str
    playback_speed: float
    daily_reminder_enabled: bool
    reminder_time: str
    dark_mode: bool
    font_size: str
    high_contrast: bool
    reduce_motion: bool

    class Config:
        from_attributes = True

class UpdateSettingsRequest(BaseModel):
    auto_play_video: Optional[bool] = None
    default_subtitles: Optional[str] = None
    playback_speed: Optional[float] = None
    daily_reminder_enabled: Optional[bool] = None
    reminder_time: Optional[str] = None
    dark_mode: Optional[bool] = None
    font_size: Optional[str] = None
    high_contrast: Optional[bool] = None
    reduce_motion: Optional[bool] = None
