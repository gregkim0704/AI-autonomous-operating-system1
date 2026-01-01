# ⚡ 빠른 배포 가이드 (5분 완성)

## 준비물
- GitHub 계정
- Render.com 계정
- Netlify 계정

---

## 🚀 Step 1: Backend 배포 (3분)

### 1. Render.com 접속
https://render.com → GitHub 로그인

### 2. Web Service 생성
```
New → Web Service
→ GitHub 저장소 연결
→ 다음 설정 입력:
```

### 3. 설정 입력
```yaml
Name: ai-aos-backend
Root Directory: ai-aos-dashboard/backend
Runtime: Docker
Dockerfile Path: Dockerfile.prod
Docker Build Context: .
Plan: Free

Environment Variables:
  ENVIRONMENT = production

Advanced:
  Health Check Path: /api/health
```

### 4. Create Web Service 클릭

### 5. URL 복사
배포 완료 후 URL 복사 (예: `https://ai-aos-backend.onrender.com`)

---

## 🎨 Step 2: Frontend 배포 (2분)

### 1. Backend URL 설정
```bash
# ai-aos-dashboard/frontend/.env.production 파일 열기
# VITE_API_URL을 위에서 복사한 URL로 변경
VITE_API_URL=https://ai-aos-backend.onrender.com
```

### 2. 빌드
```bash
cd ai-aos-dashboard/frontend
npm run build
```

### 3. Netlify Drop
1. https://app.netlify.com/drop 접속
2. `frontend/dist` 폴더 드래그 앤 드롭
3. 완료!

---

## ✅ 완료!

**Frontend**: Netlify에서 받은 URL
**Backend**: Render에서 받은 URL

브라우저에서 Frontend URL 접속 → 시뮬레이션 시작!

---

## 🔄 업데이트 방법

### Backend 업데이트
```bash
git push
# Render에서 자동 재배포
```

### Frontend 업데이트
```bash
cd ai-aos-dashboard/frontend
npm run build
# dist 폴더를 Netlify Drop에 다시 드래그
```

---

## 📱 커스텀 도메인 (선택사항)

### Netlify
Site settings → Domain management → Add custom domain

### Render
Settings → Custom Domain → Add custom domain

---

## 💡 팁

- 첫 접속 시 Backend cold start로 30초 소요 가능
- 15분 비활성 시 sleep 모드 (Free tier)
- Paid plan으로 업그레이드하면 항상 활성 상태 유지

---

상세 가이드: `FULL_DEPLOY_GUIDE.md` 참고
