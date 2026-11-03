# -*- coding: utf-8 -*-
"""
EduPath Backend - Tổng hợp Models
"""

from app.core.database import Base
from app.models.user import User, LearnerProfile, UserSettings
from app.models.onboarding import LearningGoal, Interest, PlacementQuestion, SuggestedPath, UserOnboardingState
from app.models.gamification import DailyQuest, StudyPlanItem, StudyStreakLog, WeeklyGoalLog, Badge, UserBadge, SkillNode
from app.models.course import Category, Instructor, Course, CourseSection, Lesson, CourseReview
from app.models.learning import UserLessonProgress, TimestampedNote, GlossaryTerm, OfflineDownload, FocusSession
from app.models.cohort_exam import CohortSchedule, CourseEnrollment, FinalQuiz, FinalQuizQuestion, Certificate

__all__ = [
    "Base",
    "User",
    "LearnerProfile",
    "UserSettings",
    "LearningGoal",
    "Interest",
    "PlacementQuestion",
    "SuggestedPath",
    "UserOnboardingState",
    "DailyQuest",
    "StudyPlanItem",
    "StudyStreakLog",
    "WeeklyGoalLog",
    "Badge",
    "UserBadge",
    "SkillNode",
    "Category",
    "Instructor",
    "Course",
    "CourseSection",
    "Lesson",
    "CourseReview",
    "UserLessonProgress",
    "TimestampedNote",
    "GlossaryTerm",
    "OfflineDownload",
    "FocusSession",
    "CohortSchedule",
    "CourseEnrollment",
    "FinalQuiz",
    "FinalQuizQuestion",
    "Certificate",
]
