# -*- coding: utf-8 -*-
"""
EduPath Backend - Pydantic Schemas: Khảo sát Onboarding & Kiểm tra đầu vào (S03-S09)
"""

from typing import List, Optional, Any
from pydantic import BaseModel

class LearningGoalDTO(BaseModel):
    id: int
    code: str
    title: str
    description: Optional[str]
    icon: str
    popularity_rank: int

    class Config:
        from_attributes = True

class InterestDTO(BaseModel):
    id: int
    code: str
    name: str
    category: str
    icon: str
    badge_color: str

    class Config:
        from_attributes = True

class PlacementQuestionDTO(BaseModel):
    id: int
    category: str
    question_text: str
    options: List[str]
    difficulty_level: str

    class Config:
        from_attributes = True

class PlacementAnswerItem(BaseModel):
    question_id: int
    selected_option_index: int

class PlacementSubmitRequest(BaseModel):
    answers: List[PlacementAnswerItem]

class PlacementResultDTO(BaseModel):
    total_questions: int
    correct_count: int
    score_percent: int
    assigned_level: str  # Ví dụ: "B2 - Upper Intermediate"
    strengths: List[str]
    recommendation: str

class SuggestedPathDTO(BaseModel):
    id: int
    title: str
    target_role: str
    total_weeks: int
    description: str
    milestones: List[dict]
    match_score: int

    class Config:
        from_attributes = True

class SaveOnboardingPreferencesRequest(BaseModel):
    goal_code: str
    interest_codes: List[str]
    current_level: str  # Beginner, Intermediate, Advanced
    daily_study_minutes: int

