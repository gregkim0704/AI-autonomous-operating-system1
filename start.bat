@echo off
chcp 65001 > nul
echo ========================================
echo    AI AOS Dashboard - 시작 스크립트
echo    Autonomous Operating System
echo ========================================
echo.

:: 색상 설정
color 0A

:: 현재 디렉토리 확인
cd /d "%~dp0"

echo [1/4] 환경 확인 중...

:: Python 확인
where python >nul 2>&1
if %errorlevel% neq 0 (
    echo [오류] Python이 설치되어 있지 않습니다.
    echo Python 3.10+ 버전을 설치해 주세요.
    pause
    exit /b 1
)

:: Node.js 확인
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo [오류] Node.js가 설치되어 있지 않습니다.
    echo Node.js 18+ 버전을 설치해 주세요.
    pause
    exit /b 1
)

echo [2/4] 백엔드 의존성 설치 중...
cd backend
if not exist "venv" (
    python -m venv venv
)
call venv\Scripts\activate.bat
pip install -r requirements.txt -q
cd ..

echo [3/4] 프론트엔드 의존성 설치 중...
cd frontend
if not exist "node_modules" (
    call npm install
)
cd ..

echo [4/4] 서버 시작 중...
echo.
echo ========================================
echo   백엔드: http://localhost:8000
echo   프론트엔드: http://localhost:3000
echo   API 문서: http://localhost:8000/docs
echo ========================================
echo.
echo 종료하려면 Ctrl+C를 누르세요.
echo.

:: 백엔드 시작 (새 창)
start "AOS Backend" cmd /k "cd backend && venv\Scripts\activate.bat && uvicorn app.main:app --reload --host 0.0.0.0 --port 8000"

:: 3초 대기
timeout /t 3 /nobreak > nul

:: 프론트엔드 시작 (새 창)
start "AOS Frontend" cmd /k "cd frontend && npm run dev"

:: 5초 후 브라우저 열기
timeout /t 5 /nobreak > nul
start http://localhost:3000

echo.
echo 서버가 시작되었습니다!
echo 브라우저에서 http://localhost:3000 을 열어주세요.
pause
