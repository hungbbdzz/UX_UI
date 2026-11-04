# -*- coding: utf-8 -*-
"""
EduPath Backend - Pydantic Schemas: Trình phát Học tập, Ghi chú & Từ điển (S36-S44)
"""

from typing import List, Optional
from datetime import datetime
from pydantic import BaseModel

class LessonDetailDTO(BaseModel):
    id: int
    section_id: int
    course_id: int
    course_title: str
    title: str
    lesson_type: str  # video, audio, reading, slide
    duration_minutes: int
    video_url: Optional[str]
    audio_url: Optional[str]
    reading_content: Optional[str]
    slide_url: Optional[str]
    is_preview: bool
    playback_position_seconds: int = 0
    is_completed: bool = False

    class Config:
        from_attributes = True

class UpdateProgressRequest(BaseModel):
    playback_position_seconds: int
    is_completed: bool = False

class TimestampedNoteDTO(BaseModel):
    id: int
    lesson_id: int
    timestamp_seconds: int
    timestamp_formatted: str  # "02:15"
    note_text: str
    created_at: datetime

    class Config:
        from_attributes = True

class CreateNoteRequest(BaseModel):
    timestamp_seconds: int
    note_text: str

class GlossaryTermDTO(BaseModel):
    id: int
    term: str
    category: str
    definition: str
    vietnamese_translation: Optional[str]
    example_usage: Optional[str]

    class Config:
        from_attributes = True

class OfflineDownloadDTO(BaseModel):
    id: int
    lesson_id: int
    course_id: int
    lesson_title: str
    course_title: str
    file_size_mb: float
    download_status: str
    downloaded_at: datetime

    class Config:
        from_attributes = True

class FocusSessionRequest(BaseModel):
    session_minutes: int = 25

class FocusSessionResponse(BaseModel):
    session_id: int
    session_minutes: int
    xp_earned: int
    message: str

