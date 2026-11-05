@echo off
setlocal
chcp 65001 > nul
cd /d "%~dp0"

echo ======================================================================
echo    STARTING EDUPATH BACKEND (FastAPI + SQLAlchemy 2.0)
echo    EduPath Smart Learning Platform
echo ======================================================================
echo.
echo [*] Checking Python environment...
python --version > nul 2>&1
if errorlevel 1 (
    echo [!] Error: Python not found. Please install Python 3.10+
    pause
    exit /b
)

echo [*] Installing dependencies if needed...
pip install -r requirements.txt > nul 2>&1

echo [*] Starting Uvicorn Server at http://127.0.0.1:8000 ...
echo [i] Interactive Swagger Docs: http://127.0.0.1:8000/docs
echo.
uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload

endlocal
pause
