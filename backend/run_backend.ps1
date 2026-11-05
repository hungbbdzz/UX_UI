# -*- coding: utf-8 -*-
Set-Location $PSScriptRoot

Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host "   🚀 KHỞI ĐỘNG HỆ THỐNG EDUPATH BACKEND (FASTAPI + SQLALCHEMY 2.0)" -ForegroundColor Green
Write-Host "   📌 Nền tảng học tập thông minh EduPath (FastAPI Engine)" -ForegroundColor Yellow
Write-Host "======================================================================" -ForegroundColor Cyan

$python = Get-Command python -ErrorAction SilentlyContinue
if (-not $python) {
    Write-Host "[!] Lỗi: Không tìm thấy Python trong PATH." -ForegroundColor Red
    Exit 1
}

Write-Host "[*] Đang khởi chạy Uvicorn Server tại http://127.0.0.1:8000 ..." -ForegroundColor Cyan
Write-Host "[i] Mở tài liệu Swagger UI tương tác tại: http://127.0.0.1:8000/docs" -ForegroundColor Magenta
Write-Host ""

uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload
