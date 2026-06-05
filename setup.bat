@echo off
echo ========================================
echo   BUCT-China iGEM 2025 Wiki - Setup
echo ========================================
echo.

:: Check Python
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python not found! Please install Python 3.12+
    echo          Download: https://www.python.org/downloads/
    pause
    exit /b 1
)
echo [OK] Python found

:: Create venv if not exists
if not exist "venv\Scripts\python.exe" (
    echo Creating virtual environment...
    python -m venv venv
)
echo [OK] Virtual environment ready

:: Install dependencies
echo Installing dependencies...
venv\Scripts\python.exe -m pip install Flask==3.1.3 Frozen-Flask==1.0.2 --quiet
echo [OK] Dependencies installed

:: Start server
echo.
echo ========================================
echo   Starting wiki at http://localhost:8080
echo   Press Ctrl+C to stop
echo ========================================
echo.
venv\Scripts\python.exe app.py
pause