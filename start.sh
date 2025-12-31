#!/bin/bash

# AI AOS Dashboard - 시작 스크립트
# Autonomous Operating System

echo "========================================"
echo "   AI AOS Dashboard - 시작 스크립트"
echo "   Autonomous Operating System"
echo "========================================"
echo ""

# 색상 정의
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# 현재 디렉토리로 이동
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

echo -e "${CYAN}[1/4] 환경 확인 중...${NC}"

# Python 확인
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}[오류] Python3가 설치되어 있지 않습니다.${NC}"
    echo "Python 3.10+ 버전을 설치해 주세요."
    exit 1
fi

# Node.js 확인
if ! command -v node &> /dev/null; then
    echo -e "${RED}[오류] Node.js가 설치되어 있지 않습니다.${NC}"
    echo "Node.js 18+ 버전을 설치해 주세요."
    exit 1
fi

echo -e "${GREEN}✓ Python $(python3 --version)${NC}"
echo -e "${GREEN}✓ Node $(node --version)${NC}"

echo ""
echo -e "${CYAN}[2/4] 백엔드 의존성 설치 중...${NC}"
cd backend

# 가상환경 생성 및 활성화
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi
source venv/bin/activate
pip install -r requirements.txt -q

cd ..

echo ""
echo -e "${CYAN}[3/4] 프론트엔드 의존성 설치 중...${NC}"
cd frontend

if [ ! -d "node_modules" ]; then
    npm install
fi

cd ..

echo ""
echo -e "${CYAN}[4/4] 서버 시작 중...${NC}"
echo ""
echo "========================================"
echo -e "  백엔드:     ${GREEN}http://localhost:8000${NC}"
echo -e "  프론트엔드: ${GREEN}http://localhost:3000${NC}"
echo -e "  API 문서:   ${GREEN}http://localhost:8000/docs${NC}"
echo "========================================"
echo ""
echo -e "${YELLOW}종료하려면 Ctrl+C를 누르세요.${NC}"
echo ""

# 종료 시 백그라운드 프로세스 정리
cleanup() {
    echo ""
    echo -e "${YELLOW}서버를 종료합니다...${NC}"
    kill $BACKEND_PID 2>/dev/null
    kill $FRONTEND_PID 2>/dev/null
    exit 0
}
trap cleanup SIGINT SIGTERM

# 백엔드 시작 (백그라운드)
cd backend
source venv/bin/activate
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000 &
BACKEND_PID=$!
cd ..

# 3초 대기
sleep 3

# 프론트엔드 시작 (백그라운드)
cd frontend
npm run dev &
FRONTEND_PID=$!
cd ..

# 5초 후 브라우저 열기 (macOS/Linux)
sleep 5
if command -v open &> /dev/null; then
    open http://localhost:3000
elif command -v xdg-open &> /dev/null; then
    xdg-open http://localhost:3000
fi

echo ""
echo -e "${GREEN}서버가 시작되었습니다!${NC}"
echo "브라우저에서 http://localhost:3000 을 열어주세요."
echo ""

# 프로세스 대기
wait
