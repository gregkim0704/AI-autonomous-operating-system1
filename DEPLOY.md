# Render.com 배포 가이드

## 🚀 빠른 배포 (추천)

### 방법 1: Blueprint 사용 (자동 배포)

1. GitHub에 코드 푸시
2. Render.com 접속: https://render.com
3. "New" → "Blueprint" 클릭
4. GitHub 저장소 연결
5. `render.yaml` 파일 자동 감지
6. "Apply" 클릭 → 자동 배포 시작!

### 방법 2: 수동 배포

#### Backend 배포

1. Render.com 대시보드에서 "New" → "Web Service"
2. GitHub 저장소 연결
3. 설정:
   - **Name**: `ai-aos-backend`
   - **Environment**: `Docker`
   - **Dockerfile Path**: `./backend/Dockerfile.prod`
   - **Docker Context**: `./backend`
   - **Region**: Oregon (또는 가까운 지역)
   - **Plan**: Free
4. Environment Variables 추가:
   ```
   ENVIRONMENT=production
   ```
5. "Create Web Service" 클릭

#### Frontend 배포

1. Backend 배포 완료 후 URL 복사 (예: `https://ai-aos-backend.onrender.com`)
2. "New" → "Web Service"
3. 같은 GitHub 저장소 연결
4. 설정:
   - **Name**: `ai-aos-frontend`
   - **Environment**: `Docker`
   - **Dockerfile Path**: `./frontend/Dockerfile.prod`
   - **Docker Context**: `./frontend`
   - **Region**: Oregon
   - **Plan**: Free
5. Environment Variables 추가:
   ```
   VITE_API_URL=https://ai-aos-backend.onrender.com
   ```
   (위에서 복사한 Backend URL 사용)
6. "Create Web Service" 클릭

## 📝 배포 후 확인

배포가 완료되면 (약 5-10분 소요):

- **Frontend URL**: `https://ai-aos-frontend.onrender.com`
- **Backend API**: `https://ai-aos-backend.onrender.com`
- **API Docs**: `https://ai-aos-backend.onrender.com/docs`

## ⚠️ 주의사항

### Free Tier 제한사항
- 15분 동안 요청이 없으면 자동으로 sleep 모드
- 첫 요청 시 cold start (30초~1분 소요)
- 월 750시간 무료 (1개 서비스 기준)

### 해결 방법
1. **Paid Plan 사용** ($7/월부터)
2. **Cron Job 설정** (5분마다 health check 요청)
3. **UptimeRobot** 같은 무료 모니터링 서비스 사용

## 🔧 환경변수 업데이트

배포 후 환경변수 변경이 필요한 경우:

1. Render 대시보드에서 서비스 선택
2. "Environment" 탭
3. 변수 추가/수정
4. "Save Changes" → 자동 재배포

## 🔄 자동 배포 설정

GitHub에 push하면 자동으로 재배포:

1. Render 대시보드에서 서비스 선택
2. "Settings" → "Build & Deploy"
3. "Auto-Deploy" 활성화
4. Branch 선택 (main 또는 master)

## 📊 로그 확인

문제 발생 시:

1. Render 대시보드에서 서비스 선택
2. "Logs" 탭에서 실시간 로그 확인
3. Build 로그와 Runtime 로그 모두 확인

## 🌐 커스텀 도메인 연결

1. Render 대시보드에서 서비스 선택
2. "Settings" → "Custom Domain"
3. 도메인 추가 및 DNS 설정
4. 자동 SSL 인증서 발급

## 💡 최적화 팁

### Backend 최적화
- Gunicorn workers 수 조정
- 데이터베이스 연결 풀 설정
- Redis 캐싱 추가

### Frontend 최적화
- 이미 nginx로 최적화됨
- Gzip 압축 활성화됨
- 정적 파일 캐싱 설정됨

## 🐛 트러블슈팅

### 빌드 실패
```bash
# 로컬에서 Docker 빌드 테스트
cd backend
docker build -f Dockerfile.prod -t test-backend .

cd ../frontend
docker build -f Dockerfile.prod -t test-frontend .
```

### WebSocket 연결 실패
- Backend URL이 올바른지 확인
- HTTPS 사용 시 WSS 프로토콜 사용 확인
- CORS 설정 확인

### 환경변수 미적용
- 환경변수 저장 후 재배포 확인
- 빌드 로그에서 환경변수 출력 확인

## 📞 지원

문제가 계속되면:
- Render 문서: https://render.com/docs
- Render 커뮤니티: https://community.render.com
- GitHub Issues 생성
