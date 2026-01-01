# 📦 AI AOS Dashboard 배포 가이드 패키지

## 📚 포함된 파일

### 1. README_DEPLOY.md
- **용도**: 시작 가이드
- **내용**: 어떤 가이드를 선택할지 안내
- **추천 대상**: 모든 사용자

### 2. QUICK_DEPLOY.md ⚡
- **용도**: 빠른 배포 (5분)
- **내용**: 핵심 단계만 간단히
- **추천 대상**: 경험 있는 개발자

### 3. FULL_DEPLOY_GUIDE.md 📖
- **용도**: 완전 배포 가이드
- **내용**: 모든 단계를 상세히 설명
- **추천 대상**: 처음 배포하는 분

### 4. README.docker.md 🐳
- **용도**: Docker 배포
- **내용**: Docker Compose, 클라우드 배포
- **추천 대상**: Docker 사용자

### 5. TROUBLESHOOTING.md 🔧
- **용도**: 문제 해결
- **내용**: 일반적인 에러와 해결 방법
- **추천 대상**: 배포 중 문제 발생 시

### 6. DEPLOY.md
- **용도**: Render.com 배포 가이드
- **내용**: Render 특화 가이드
- **추천 대상**: Render 사용자

---

## 🚀 빠른 시작

### 처음 배포하시나요?
👉 **FULL_DEPLOY_GUIDE.md** 읽기

### 빠르게 배포하고 싶으신가요?
👉 **QUICK_DEPLOY.md** 읽기

### Docker를 사용하시나요?
👉 **README.docker.md** 읽기

### 문제가 발생했나요?
👉 **TROUBLESHOOTING.md** 읽기

---

## 📋 배포 요약

### Backend: Render.com
```
1. Render.com 접속
2. Web Service 생성
3. Docker 설정
4. 배포 완료
```

### Frontend: Netlify
```
1. npm run build
2. Netlify Drop에 드래그
3. 배포 완료
```

### 소요 시간
- Backend: 5-10분
- Frontend: 2-3분
- **총 10분 이내 완료!**

---

## 🎯 배포 체크리스트

- [ ] GitHub 계정 준비
- [ ] Render.com 계정 생성
- [ ] Netlify 계정 생성
- [ ] Backend 배포
- [ ] Backend URL 복사
- [ ] Frontend 환경변수 설정
- [ ] Frontend 빌드
- [ ] Frontend 배포
- [ ] 접속 테스트

---

## 💰 비용

### 무료 티어
- **Render**: 월 750시간 무료
- **Netlify**: 월 100GB 대역폭 무료
- **총 비용**: $0/월 🎉

### Paid Plan (선택사항)
- **Render Starter**: $7/월
- **Netlify Pro**: $19/월

---

## 🌐 배포 후 URL

### Backend
```
https://ai-aos-backend.onrender.com
https://ai-aos-backend.onrender.com/docs (API 문서)
https://ai-aos-backend.onrender.com/api/health (Health Check)
```

### Frontend
```
https://your-site.netlify.app
```

---

## 📞 지원

### 문서
- Render: https://render.com/docs
- Netlify: https://docs.netlify.com

### 커뮤니티
- Render Community: https://community.render.com
- Netlify Community: https://answers.netlify.com

---

## 🎉 배포 성공 후

1. Frontend URL 접속
2. 시뮬레이션 시작 버튼 클릭
3. AI 에이전트 작동 확인
4. WebSocket 연결 상태 확인 (우측 하단)

---

## 📝 업데이트 방법

### 코드 수정 후
```bash
git add .
git commit -m "업데이트"
git push
```

- Backend: Render에서 자동 재배포
- Frontend: Netlify에서 자동 재배포 (GitHub 연동 시)

---

## ⚠️ 주의사항

### Free Tier 제한
- 15분 비활성 시 sleep 모드
- 첫 요청 시 30초~1분 cold start
- 프로덕션 환경에서는 Paid plan 권장

### 보안
- 환경변수에 민감한 정보 저장 금지
- API 키는 환경변수로 관리
- CORS 설정 확인

---

## 🎓 학습 자료

### Backend (FastAPI)
- https://fastapi.tiangolo.com

### Frontend (React + Vite)
- https://react.dev
- https://vitejs.dev

### Docker
- https://docs.docker.com

---

**Happy Deploying! 🚀**

버전: 1.0.0
최종 업데이트: 2026-01-01
