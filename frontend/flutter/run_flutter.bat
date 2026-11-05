@echo off
setlocal
chcp 65001 > nul
cd /d "%~dp0"

echo ======================================================================
echo    🚀 KHỞI ĐỘNG EDUPATH FLUTTER WEB (98 MÀN HÌNH S01 - S96)
echo ======================================================================
echo.
echo [*] Đang kích hoạt Server cục bộ và mở trình duyệt...
echo [*] Ứng dụng chạy tại: http://127.0.0.1:3000
echo.

start "" "http://127.0.0.1:3000"
python -m http.server 3000 --directory "build\web"

endlocal
pause
