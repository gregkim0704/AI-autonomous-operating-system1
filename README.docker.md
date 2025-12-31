# Docker 배포 가이드

## 빠른 시작

### 1. 전체 시스템 실행 (개발 모드)
```bash
docker-compose up
```

### 2. 전체 시스템 실행 (프로덕션 모드)
```bash
docker-compose -f docker-compose.yml up -d
```

### 3. 개별 서비스 빌드
```bash
# Backend만
docker build -f backend/Dockerfile.prod -t ai-aos-backend backend/

# Frontend만
docker build -f frontend/Dockerfile.prod -t ai-aos-frontend frontend/
```

### 4. 개별 서비스 실행
```bash
# Backend
docker run -p 8000:8000 ai-aos-backend

# Frontend
docker run -p 80:80 ai-aos-frontend
```

## 접속 주소

- **Frontend**: http://localhost
- **Backend API**: http://localhost:8000
- **API Docs**: http://localhost:8000/docs

## 중지 및 정리

```bash
# 중지
docker-compose down

# 볼륨까지 삭제
docker-compose down -v

# 이미지까지 삭제
docker-compose down --rmi all
```

## 클라우드 배포

### AWS ECS / Azure Container Instances / GCP Cloud Run
1. 이미지 빌드 및 푸시
```bash
# Docker Hub
docker tag ai-aos-backend your-username/ai-aos-backend:latest
docker push your-username/ai-aos-backend:latest

docker tag ai-aos-frontend your-username/ai-aos-frontend:latest
docker push your-username/ai-aos-frontend:latest
```

### Render.com (추천)
1. GitHub에 코드 푸시
2. Render.com에서 New Web Service 생성
3. Backend: Docker 선택, Dockerfile.prod 지정
4. Frontend: Docker 선택, Dockerfile.prod 지정

### Railway.app
1. GitHub 연동
2. New Project → Deploy from GitHub
3. 자동으로 Dockerfile 감지

### Fly.io
```bash
# Fly CLI 설치 후
fly launch
fly deploy
```

## 환경 변수 설정

프로덕션 환경에서는 `.env` 파일 생성:

```env
# Backend
ENVIRONMENT=production
API_KEY=your-api-key
DATABASE_URL=your-database-url

# Frontend
VITE_API_URL=https://your-backend-url.com
```

## 트러블슈팅

### 포트 충돌
```bash
# 사용 중인 포트 확인 (Windows)
netstat -ano | findstr :8000
netstat -ano | findstr :80
```

### 로그 확인
```bash
docker-compose logs -f backend
docker-compose logs -f frontend
```

### 컨테이너 재시작
```bash
docker-compose restart backend
docker-compose restart frontend
```
