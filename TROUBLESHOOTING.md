# Render.com 배포 트러블슈팅

## 로그 확인 방법

1. Render 대시보드에서 실패한 서비스 클릭
2. "Logs" 탭 선택
3. 에러 메시지 확인

## 일반적인 에러와 해결 방법

### 1. "Failed to build Docker image"

**원인**: Dockerfile 경로 또는 빌드 오류

**해결**:
```yaml
# render.yaml 확인
dockerfilePath: ./backend/Dockerfile.prod  # 경로 확인
dockerContext: ./backend                    # 컨텍스트 확인
```

### 2. "Module not found" (Backend)

**원인**: Python 의존성 누락

**해결**:
```bash
# requirements.txt 확인
cd backend
pip freeze > requirements.txt
```

### 3. "npm ERR!" (Frontend)

**원인**: Node 의존성 또는 빌드 오류

**해결**:
```bash
# 로컬에서 빌드 테스트
cd frontend
npm ci
npm run build
```

### 4. "Health check failed"

**원인**: 서버가 시작되지 않거나 health check 경로 오류

**해결**:
- Backend가 정상 실행되는지 확인
- `/api/health` 엔드포인트 확인
- 로그에서 서버 시작 메시지 확인

### 5. "Port already in use"

**원인**: Render는 PORT 환경변수 사용

**해결**:
```dockerfile
# Dockerfile.prod
CMD uvicorn app.main:app --host 0.0.0.0 --port ${PORT:-8000}
```

### 6. WebSocket 연결 실패

**원인**: HTTPS에서 WS 프로토콜 사용

**해결**:
- HTTPS는 WSS 사용
- App.jsx에서 자동 처리됨
- CORS 설정 확인

### 7. "CORS policy" 에러

**원인**: Backend CORS 설정

**해결**:
```python
# app/main.py
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # 또는 특정 도메인
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
```

### 8. 환경변수 미적용

**원인**: 빌드 시점에 환경변수 필요

**해결**:
- Render 대시보드에서 환경변수 설정
- "Save Changes" 후 재배포
- 빌드 로그에서 환경변수 확인

## 로컬 테스트

### Backend 테스트
```bash
cd backend
docker build -f Dockerfile.prod -t test-backend .
docker run -p 8000:8000 test-backend

# 다른 터미널에서
curl http://localhost:8000/api/health
```

### Frontend 테스트
```bash
cd frontend
docker build -f Dockerfile.prod -t test-frontend .
docker run -p 80:80 test-frontend

# 브라우저에서
# http://localhost
```

## Blueprint 재배포

1. render.yaml 수정
2. GitHub에 푸시
3. Render 대시보드에서 "Manual Deploy" 클릭

## 수동 배포로 전환

Blueprint가 계속 실패하면:

1. 기존 Blueprint 삭제
2. 수동으로 각 서비스 생성
3. DEPLOY.md의 "방법 2" 참고

## 로그 예시

### 성공적인 배포
```
==> Building...
==> Deploying...
==> Your service is live 🎉
```

### 실패한 배포
```
ERROR: failed to solve: ...
==> Build failed
```

## 도움이 필요하면

1. Render 로그 전체 복사
2. GitHub Issues에 로그 첨부
3. 또는 Render Support 문의
