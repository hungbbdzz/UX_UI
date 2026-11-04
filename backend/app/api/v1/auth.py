# -*- coding: utf-8 -*-
"""
EduPath Backend - Router: Xác thực & Quản lý Tài khoản (A01, A02)
"""

from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session

from app.core.database import get_db
from app.core.security import verify_password, get_password_hash, create_access_token
from app.api.deps import get_current_user
from app.models.user import User, LearnerProfile, UserSettings
from app.schemas.auth import (
    UserRegisterRequest,
    UserLoginRequest,
    TokenResponse,
    UserProfileDTO
)

router = APIRouter(prefix="/auth", tags=["00 · Xác thực & Tài khoản (A01, A02)"])

@router.post("/register", response_model=TokenResponse, status_code=status.HTTP_201_CREATED, summary="Đăng ký tài khoản học viên mới (A02)")
def register_user(payload: UserRegisterRequest, db: Session = Depends(get_db)):
    """Đăng ký tài khoản mới cho học viên và tự động khởi tạo Profile & Settings"""
    existing_user = db.query(User).filter(User.email == payload.email).first()
    if existing_user:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Email này đã được sử dụng. Vui lòng đăng nhập hoặc chọn email khác."
        )

    # Tạo User mới
    new_user = User(
        email=payload.email,
        full_name=payload.full_name,
        hashed_password=get_password_hash(payload.password),
        role=payload.role or "learner",
        is_active=True
    )
    db.add(new_user)
    db.commit()
    db.refresh(new_user)

    # Khởi tạo Profile mặc định
    profile = LearnerProfile(
        user_id=new_user.id,
        bio=f"Học viên {payload.full_name} - Khóa học UX/UI & Lập trình",
        current_level="Beginner",
        daily_study_minutes=30,
        xp=100,
        level=1,
        streak_count=1,
        longest_streak=1
    )
    db.add(profile)

    # Khởi tạo Settings mặc định
    user_settings = UserSettings(user_id=new_user.id)
    db.add(user_settings)
    db.commit()

    token = create_access_token(subject=new_user.id)
    return TokenResponse(
        access_token=token,
        user_id=new_user.id,
        full_name=new_user.full_name,
        email=new_user.email,
        role=new_user.role
    )

@router.post("/login", response_model=TokenResponse, summary="Đăng nhập tài khoản (A01)")
def login_user(payload: UserLoginRequest, db: Session = Depends(get_db)):
    """Xác thực tài khoản và trả về JWT Bearer Token"""
    user = db.query(User).filter(User.email == payload.email).first()
    if not user or not verify_password(payload.password, user.hashed_password):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Email hoặc mật khẩu không chính xác."
        )

    if not user.is_active:
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail="Tài khoản đang bị tạm khóa."
        )

    token = create_access_token(subject=user.id)
    return TokenResponse(
        access_token=token,
        user_id=user.id,
        full_name=user.full_name,
        email=user.email,
        role=user.role
    )

@router.get("/me", response_model=UserProfileDTO, summary="Lấy thông tin tài khoản hiện tại")
def get_current_user_profile(current_user: User = Depends(get_current_user)):
    """Trả về chi tiết thông tin và thống kê cấp độ của người dùng đang đăng nhập"""
    prof = current_user.profile
    return UserProfileDTO(
        id=current_user.id,
        email=current_user.email,
        full_name=current_user.full_name,
        role=current_user.role,
        avatar_url=prof.avatar_url if prof else None,
        bio=prof.bio if prof else None,
        xp=prof.xp if prof else 0,
        level=prof.level if prof else 1,
        streak_count=prof.streak_count if prof else 0,
        created_at=current_user.created_at
    )

