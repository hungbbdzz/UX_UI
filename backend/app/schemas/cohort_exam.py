# -*- coding: utf-8 -*-
"""
EduPath Backend - Pydantic Schemas: Lịch học nhóm, Khóa học của tôi, Thi & Chứng chỉ (S45-S48)
"""

from typing import List, Optional
from datetime import date, datetime
from pydantic import BaseModel

class CohortScheduleDTO(BaseModel):
    id: int
    course_id: int
    cohort_name: str
    instructor_name: str
    start_date: date
    meeting_time: str
    meeting_platform: str
    max_learners: int
    enrolled_learners: int
    meeting_link: str

    class Config:
        from_attributes = True

class EnrolledCourseItemDTO(BaseModel):
    enrollment_id: int
    course_id: int
    title: str
    instructor_name: str
    thumbnail_url: str
    progress_percent: float
    status: str
    total_lessons: int
    completed_lessons: int
    enrolled_at: datetime

    class Config:
        from_attributes = True

class FinalQuizQuestionDTO(BaseModel):
    id: int
    question_text: str
    options: List[str]

    class Config:
        from_attributes = True

class FinalQuizDTO(BaseModel):
    id: int
    course_id: int
    title: str
    total_questions: int
    time_limit_minutes: int
    passing_score: int
    questions: List[FinalQuizQuestionDTO]

class SubmitQuizAnswerItem(BaseModel):
    question_id: int
    selected_option_index: int

class SubmitQuizRequest(BaseModel):
    answers: List[SubmitQuizAnswerItem]

class QuizResultDTO(BaseModel):
    total_questions: int
    correct_count: int
    score_percent: int
    is_passed: bool
    certificate_eligible: bool
    feedback: str

class CertificateDTO(BaseModel):
    id: int
    certificate_code: str
    student_name: str
    course_title: str
    instructor_name: str
    issued_date: date
    final_grade: str
    verification_url: str

    class Config:
        from_attributes = True

class NextCourseRecommendationDTO(BaseModel):
    course_id: int
    title: str
    instructor_name: str
    thumbnail_url: str
    reason: str
    match_percentage: int
