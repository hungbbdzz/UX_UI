# -*- coding: utf-8 -*-
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host "   🚀 KHỞI ĐỘNG HỆ THỐNG EDUPATH BACKEND (FASTAPI + SQLALCHEMY 2.0)" -ForegroundColor Green
Write-Host "   📌 Đồ án UX/UI - Nhóm Rise (VKU - ĐH Đà Nẵng)" -ForegroundColor Yellow
Write-Host "   📌 Giảng viên hướng dẫn: ThS. Lý Quỳnh Trân" -ForegroundColor Yellow
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
