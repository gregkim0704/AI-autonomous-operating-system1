# 🚀 Frontend + Backend 완전 배포 가이드

## 배포 전략

**Backend**: Render.com (무료)
**Frontend**: Netlify (무료)

---

## 📋 배포 순서

### 1단계: Backend 배포 (Render.com)
### 2단계: Frontend 배포 (Netlify)
### 3단계: 연결 확인

---

## 🔧 1단계: Backend 배포 (Render.com)

### A. Render.com 회원가입
1. https://render.com 접속
2. GitHub 계정으로 회원가입/로그인

### B. Backend 서비스 생성

1. **"New" → "Web Service" 클릭**

2. **GitHub 저장소 연결**
   - "Connect a repository" 클릭
   - 저장소 선택 및 권한 부여

3. **서비스 설정**
   ```
   Name: ai-aos-backend
   Region: Oregon (또는 가까운 지역)
   Branch: main (또는 master)
   Root Directory: ai-aos-dashboard/backend
   Runtime: Docker
   Dockerfile Path: Dockerfile.prod
   Docker Build Context Directory: .
   ```

4. **Plan 선택**
   - Free 선택

5. **Environment Variables 추가**
   ```
   ENVIRONMENT = production
   ```

6. **Advanced 설정**
   ```
   Health Check Path: /api/health
   ```

7. **"Create Web Service" 클릭**

8. **배포 대기** (5-10분 소요)
   - 로그에서 진행 상황 확인
   - "Your service is live 🎉" 메시지 확인

9. **Backend URL 복사**
   - 예: `https://ai-aos-backend.onrender.com`
   - 이 URL을 메모장에 저장!

10. **테스트**
    - 브라우저에서 접속: `https://ai-aos-backend.onrender.com/docs`
    - API 문서가 보이면 성공!

---

## 🎨 2단계: Frontend 배포 (Netlify)

### 방법 A: Netlify Drop (가장 빠름)

1. **환경변수 설정 후 빌드**
   ```bash
   cd ai-aos-dashboard/frontend
   
   # .env.production 파일 수정
   # VITE_API_URL을 위에서 복사한 Backend URL로 변경
   ```

2. **.env.production 파일 확인/수정**
   ```env
   VITE_API_URL=https://ai-aos-backend.onrender.com
   ```

3. **빌드**
   ```bash
   npm run build
   ```

4. **Netlify Drop으로 배포**
   - https://app.netlify.com/drop 접속
   - `frontend/dist` 폴더를 드래그 앤 드롭
   - 즉시 배포 완료!

5. **Frontend URL 받기**
   - 예: `https://random-name-123.netlify.app`

### 방법 B: GitHub 연동 (자동 배포)

1. **Netlify 사이트 생성**
   - https://app.netlify.com 로그인
   - "Add new site" → "Import an existing project"
   - GitHub 저장소 연결

2. **빌드 설정**
   ```
   Base directory: ai-aos-dashboard/frontend
   Build command: npm run build
   Publish directory: dist
   ```

3. **Environment Variables 설정**
   - Site settings → Environment variables → Add a variable
   ```
   Key: VITE_API_URL
   Value: https://ai-aos-backend.onrender.com
   ```
   (위에서 복사한 Backend URL 사용)

4. **Deploy site 클릭**

5. **배포 완료 대기** (2-3분)

---

## ✅ 3단계: 연결 확인

### Backend 확인
```bash
# API Health Check
curl https://ai-aos-backend.onrender.com/api/health

# API 문서
브라우저: https://ai-aos-backend.onrender.com/docs
```

### Frontend 확인
```
브라우저: https://your-site.netlify.app
```

### 통합 테스트
1. Frontend 사이트 접속
2. 시뮬레이션 시작 버튼 클릭
3. 에이전트 메시지가 나타나는지 확인
4. WebSocket 연결 상태 확인 (우측 하단)

---

## 🔄 업데이트 방법

### Backend 업데이트
```bash
# 코드 수정 후
git add .
git commit -m "Backend 업데이트"
git push

# Render에서 자동 재배포
```

### Frontend 업데이트

**방법 A: Netlify Drop 사용 시**
```bash
cd ai-aos-dashboard/frontend
npm run build
# dist 폴더를 다시 드래그 앤 드롭
```

**방법 B: GitHub 연동 시**
```bash
# 코드 수정 후
git add .
git commit -m "Frontend 업데이트"
git push

# Netlify에서 자동 재배포
```

---

## 🎯 빠른 배포 체크리스트

- [ ] Render.com 회원가입
- [ ] Backend 서비스 생성
- [ ] Backend 배포 완료 확인
- [ ] Backend URL 복사
- [ ] Frontend .env.production에 Backend URL 설정
- [ ] Frontend 빌드 (npm run build)
- [ ] Netlify에 배포
- [ ] Frontend 접속 테스트
- [ ] WebSocket 연결 확인

---

## ⚠️ 주의사항

### Free Tier 제한
- **Render**: 15분 비활성 시 sleep, 첫 요청 시 30초~1분 cold start
- **Netlify**: 월 100GB 대역폭, 300분 빌드 시간

### CORS 설정
Backend의 `app/main.py`에서 CORS가 이미 설정되어 있습니다:
```python
allow_origins=["*"]  # 모든 도메인 허용
```

프로덕션에서는 특정 도메인만 허용하는 것이 좋습니다:
```python
allow_origins=["https://your-site.netlify.app"]
```

### WebSocket 연결
- HTTP → WS
- HTTPS → WSS
- Frontend 코드에서 자동 처리됨

---

## 🐛 트러블슈팅

### Backend 배포 실패
```bash
# 로컬에서 Docker 테스트
cd ai-aos-dashboard/backend
docker build -f Dockerfile.prod -t test-backend .
docker run -p 8000:8000 test-backend
```

### Frontend 빌드 실패
```bash
# 의존성 재설치
cd ai-aos-dashboard/frontend
rm -rf node_modules package-lock.json
npm install
npm run build
```

### WebSocket 연결 실패
1. Backend URL이 올바른지 확인
2. Backend가 실행 중인지 확인
3. 브라우저 콘솔에서 에러 확인
4. HTTPS 사이트는 WSS 사용 확인

### API 호출 실패
1. CORS 설정 확인
2. Backend URL 확인
3. 네트워크 탭에서 요청 확인

---

## 💰 비용 최적화

### 무료로 유지하기
- Render: 월 750시간 무료 (1개 서비스 기준)
- Netlify: 월 100GB 대역폭 무료

### Paid Plan 고려 시점
- 사용자가 많아질 때
- Cold start가 문제될 때
- 더 많은 리소스가 필요할 때

**Render Starter**: $7/월
**Netlify Pro**: $19/월

---

## 📞 도움말

### Render 문서
- https://render.com/docs

### Netlify 문서
- https://docs.netlify.com

### 이슈 발생 시
1. 로그 확인
2. 환경변수 확인
3. 빌드 설정 확인
4. GitHub Issues 생성

---

## 🎉 배포 완료!

축하합니다! 이제 다음 URL에서 접속 가능합니다:

- **Frontend**: https://your-site.netlify.app
- **Backend API**: https://ai-aos-backend.onrender.com
- **API Docs**: https://ai-aos-backend.onrender.com/docs

전 세계 어디서나 접속 가능한 AI AOS Dashboard가 완성되었습니다! 🚀
