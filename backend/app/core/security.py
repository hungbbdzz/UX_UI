# -*- coding: utf-8 -*-
"""
EduPath Backend - Tiện ích Bảo mật & Mã hóa JWT (NIST PBKDF2 Standard)
"""

from datetime import datetime, timedelta, timezone
from typing import Optional, Any
import hashlib
import os
import jwt

from app.core.config import settings

def get_password_hash(password: str) -> str:
    """Băm mật khẩu người dùng bằng PBKDF2-HMAC-SHA256 chuẩn NIST với 100,000 vòng lặp"""
    salt = os.urandom(16).hex()
    key = hashlib.pbkdf2_hmac(
        'sha256',
        password.encode('utf-8'),
        salt.encode('utf-8'),
        100000
    ).hex()
    return f"{salt}${key}"

def verify_password(plain_password: str, hashed_password: str) -> bool:
    """Xác thực mật khẩu người dùng với salt hash"""
    if not hashed_password or "$" not in hashed_password:
        return False
    try:
        salt, key = hashed_password.split("$", 1)
        check_key = hashlib.pbkdf2_hmac(
            'sha256',
            plain_password.encode('utf-8'),
            salt.encode('utf-8'),
            100000
        ).hex()
        return check_key == key
    except Exception:
        return False

def create_access_token(subject: str | Any, expires_delta: Optional[timedelta] = None) -> str:
    """Sinh chuỗi JWT Token có thời hạn"""
    if expires_delta:
        expire = datetime.now(timezone.utc) + expires_delta
    else:
        expire = datetime.now(timezone.utc) + timedelta(minutes=settings.ACCESS_TOKEN_EXPIRE_MINUTES)
    
    to_encode = {"exp": expire, "sub": str(subject)}
    encoded_jwt = jwt.encode(to_encode, settings.SECRET_KEY, algorithm=settings.ALGORITHM)
    return encoded_jwt

def decode_access_token(token: str) -> Optional[dict]:
    """Giải mã và kiểm tra tính hợp lệ của JWT Token"""
    try:
        payload = jwt.decode(token, settings.SECRET_KEY, algorithms=[settings.ALGORITHM])
        return payload
    except jwt.PyJWTError:
        return None
