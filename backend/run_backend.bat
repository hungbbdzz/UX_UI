@echo off
chcp 65001 > nul
echo ======================================================================
echo    🚀 KHỞI ĐỘNG HỆ THỐNG EDUPATH BACKEND (FASTAPI + SQLALCHEMY 2.0)
echo    📌 Nền tảng học tập thông minh EduPath (FastAPI Engine)
echo ======================================================================
echo.
echo [*] Đang kiểm tra môi trường Python...
python --version > nul 2>&1
if %errorlevel% neq 0 (
    echo [!] Lỗi: Không tìm thấy Python trên máy tính. Vui lòng cài đặt Python 3.10 trở lên.
    pause
    exit /b
)

echo [*] Đang cài đặt thư viện cần thiết...
pip install -r requirements.txt > nul 2>&1

echo [*] Đang khởi chạy Uvicorn Server tại http://127.0.0.1:8000 ...
echo [i] Mở trình duyệt xem tài liệu Swagger: http://127.0.0.1:8000/docs
echo.
uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload
pause

