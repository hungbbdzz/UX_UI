# -*- coding: utf-8 -*-
"""
EduPath Backend - Tổng hợp Pydantic Schemas
"""

from app.schemas.auth import (
    UserRegisterRequest,
    UserLoginRequest,
    TokenResponse,
    UserProfileDTO
)
from app.schemas.onboarding import (
    LearningGoalDTO,
    InterestDTO,
    PlacementQuestionDTO,
    PlacementSubmitRequest,
    PlacementResultDTO,
    SuggestedPathDTO,
    SaveOnboardingPreferencesRequest
)
from app.schemas.learner import (
    DailyQuestDTO,
    StudyPlanItemDTO,
    StudyStreakDTO,
    WeeklyGoalDTO,
    LearningStatisticsDTO,
    BadgeDTO,
    LevelXpDTO,
    LearnerProfileDetailDTO,
    UpdateProfileRequest,
    SkillNodeDTO,
    UserSettingsDTO,
    UpdateSettingsRequest
)
from app.schemas.course import (
    CategoryDTO,
    InstructorDTO,
    CourseSummaryDTO,
    CourseDetailDTO,
    CourseSectionDTO,
    LessonSummaryDTO,
    CourseReviewDTO,
    CreateReviewRequest,
    CourseComparisonDTO
)
from app.schemas.learning import (
    LessonDetailDTO,
    UpdateProgressRequest,
    TimestampedNoteDTO,
    CreateNoteRequest,
    GlossaryTermDTO,
    OfflineDownloadDTO,
    FocusSessionRequest,
    FocusSessionResponse
)
from app.schemas.cohort_exam import (
    CohortScheduleDTO,
    EnrolledCourseItemDTO,
    FinalQuizDTO,
    SubmitQuizRequest,
    QuizResultDTO,
    CertificateDTO,
    NextCourseRecommendationDTO
)
