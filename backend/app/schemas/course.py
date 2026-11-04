# -*- coding: utf-8 -*-
"""
EduPath Backend - Pydantic Schemas: Khóa học, Khám phá & So sánh (S25-S35)
"""

from typing import List, Optional
from datetime import datetime
from pydantic import BaseModel

class CategoryDTO(BaseModel):
    id: int
    name: str
    slug: str
    icon: str
    color: str
    courses_count: int
    is_featured: bool

    class Config:
        from_attributes = True

class InstructorDTO(BaseModel):
    id: int
    name: str
    title: str
    organization: str
    avatar_url: str
    bio: str
    total_students: int
    average_rating: float
    total_courses: int

    class Config:
        from_attributes = True

class CourseSummaryDTO(BaseModel):
    id: int
    title: str
    slug: str
    category_name: str
    instructor_name: str
    thumbnail_url: str
    price: int
    original_price: int
    is_free: bool
    level: str
    duration_hours: float
    total_lessons: int
    rating: float
    reviews_count: int
    students_enrolled: int
    is_featured: bool
    is_trending: bool

    class Config:
        from_attributes = True

class LessonSummaryDTO(BaseModel):
    id: int
    title: str
    lesson_type: str
    duration_minutes: int
    is_preview: bool
    order_index: int

    class Config:
        from_attributes = True

class CourseSectionDTO(BaseModel):
    id: int
    title: str
    order_index: int
    lessons: List[LessonSummaryDTO]

    class Config:
        from_attributes = True

class CourseReviewDTO(BaseModel):
    id: int
    user_name: str
    user_avatar: str
    rating: int
    comment: str
    created_at: datetime

    class Config:
        from_attributes = True

class CreateReviewRequest(BaseModel):
    rating: int
    comment: str

class CourseDetailDTO(BaseModel):
    id: int
    title: str
    slug: str
    category_id: int
    category_name: str
    instructor: InstructorDTO
    thumbnail_url: str
    price: int
    original_price: int
    is_free: bool
    level: str
    duration_hours: float
    total_lessons: int
    rating: float
    reviews_count: int
    students_enrolled: int
    description: str
    what_you_will_learn: List[str]
    requirements: List[str]
    sections: List[CourseSectionDTO]
    reviews: List[CourseReviewDTO]
    is_enrolled: bool = False

    class Config:
        from_attributes = True

class CourseComparisonDTO(BaseModel):
    courses: List[CourseDetailDTO]
    comparison_points: List[dict]

