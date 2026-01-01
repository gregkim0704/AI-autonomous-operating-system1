# Netlify 배포 가이드

## 빠른 배포 (드래그 앤 드롭)

1. https://app.netlify.com/drop 접속
2. `frontend/dist` 폴더를 드래그 앤 드롭
3. 완료! 🎉

## CLI로 배포

### 1. Netlify CLI 설치
```bash
npm install -g netlify-cli
```

### 2. 로그인
```bash
netlify login
```

### 3. 배포
```bash
cd ai-aos-dashboard/frontend
netlify deploy --prod --dir=dist
```

## GitHub 연동 (자동 배포)

### 1. Netlify 사이트 생성
1. https://app.netlify.com 로그인
2. "Add new site" → "Import an existing project"
3. GitHub 저장소 연결

### 2. 빌드 설정
- **Base directory**: `ai-aos-dashboard/frontend`
- **Build command**: `npm run build`
- **Publish directory**: `dist`

### 3. 환경변수 설정 (선택사항)
Backend API URL을 설정하려면:
- Site settings → Environment variables
- `VITE_API_URL` = `https://your-backend-url.com`

### 4. 배포
- GitHub에 push하면 자동 배포!

## 현재 dist 폴더 위치
```
ai-aos-dashboard/frontend/dist/
├── assets/
│   ├── index-Dby1V66K.css
│   └── index-Dq-w9B1v.js
└── index.html
```

## 주의사항

### Backend 연결
현재 Frontend는 로컬 개발 환경 설정입니다:
- WebSocket: `ws://localhost:8000/ws`
- API: `/api` (프록시)

프로덕션에서는 실제 Backend URL이 필요합니다.

### Backend 배포 옵션
1. **Render.com** (추천)
2. **Railway.app**
3. **Fly.io**
4. **Heroku**

Backend를 배포한 후 Frontend 환경변수에 URL을 설정하세요.

## 재빌드
```bash
cd ai-aos-dashboard/frontend
npm run build
```

새로운 dist 폴더가 생성됩니다.
