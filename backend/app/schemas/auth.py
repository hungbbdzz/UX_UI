# -*- coding: utf-8 -*-
"""
EduPath Backend - Pydantic Schemas: Xác thực & Đăng ký (A01, A02)
"""

from typing import Optional
from datetime import datetime
from pydantic import BaseModel, EmailStr, Field

class UserRegisterRequest(BaseModel):
    full_name: str = Field(..., example="Nguyễn Văn Hùng", min_length=2)
    email: EmailStr = Field(..., example="hung.nv@edupath.vn")
    password: str = Field(..., example="EduPath2026!", min_length=6)
    role: Optional[str] = "learner"

class UserLoginRequest(BaseModel):
    email: EmailStr = Field(..., example="hung.nv@edupath.vn")
    password: str = Field(..., example="EduPath2026!")

class TokenResponse(BaseModel):
    access_token: str
    token_type: str = "bearer"
    user_id: int
    full_name: str
    email: str
    role: str

class UserProfileDTO(BaseModel):
    id: int
    email: str
    full_name: str
    role: str
    avatar_url: Optional[str] = None
    bio: Optional[str] = None
    xp: int
    level: int
    streak_count: int
    created_at: datetime

    class Config:
        from_attributes = True

