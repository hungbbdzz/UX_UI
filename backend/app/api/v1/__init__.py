# -*- coding: utf-8 -*-
"""
EduPath Backend - Tổng hợp API Routers v1
"""

from fastapi import APIRouter

from app.api.v1.auth import router as auth_router
from app.api.v1.onboarding import router as onboarding_router
from app.api.v1.learner import router as learner_router
from app.api.v1.courses import router as courses_router
from app.api.v1.learning import router as learning_router
from app.api.v1.my_courses import router as my_courses_router

api_router = APIRouter()

api_router.include_router(auth_router)
api_router.include_router(onboarding_router)
api_router.include_router(learner_router)
api_router.include_router(courses_router)
api_router.include_router(learning_router)
api_router.include_router(my_courses_router)
