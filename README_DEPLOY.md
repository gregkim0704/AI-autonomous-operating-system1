# 🚀 AI AOS Dashboard 배포 가이드

## 📚 가이드 선택

### ⚡ [QUICK_DEPLOY.md](QUICK_DEPLOY.md) - 5분 빠른 배포
바쁘신 분들을 위한 핵심만 담은 가이드

### 📖 [FULL_DEPLOY_GUIDE.md](FULL_DEPLOY_GUIDE.md) - 완전 배포 가이드
처음 배포하시는 분들을 위한 상세 가이드

### 🐳 [README.docker.md](README.docker.md) - Docker 배포
Docker로 배포하고 싶으신 분들을 위한 가이드

### 🔧 [TROUBLESHOOTING.md](TROUBLESHOOTING.md) - 문제 해결
배포 중 문제가 발생했을 때

---

## 🎯 추천 배포 방법

### Backend: Render.com
- ✅ 무료 티어
- ✅ Docker 지원
- ✅ 자동 배포
- ✅ HTTPS 자동 설정

### Frontend: Netlify
- ✅ 무료 티어
- ✅ CDN 제공
- ✅ 즉시 배포
- ✅ HTTPS 자동 설정

---

## 📋 배포 체크리스트

### 준비물
- [ ] GitHub 계정
- [ ] Render.com 계정
- [ ] Netlify 계정

### Backend 배포
- [ ] Render.com에서 Web Service 생성
- [ ] Docker 설정 입력
- [ ] 배포 완료 확인
- [ ] Backend URL 복사

### Frontend 배포
- [ ] .env.production에 Backend URL 설정
- [ ] npm run build 실행
- [ ] Netlify에 배포
- [ ] 접속 테스트

---

## 🚀 지금 바로 시작하기

### 1. Backend 배포 (3분)
```
Render.com → New Web Service
→ GitHub 연결
→ Docker 설정
→ 배포!
```

### 2. Frontend 배포 (2분)
```bash
cd ai-aos-dashboard/frontend
npm run build
# dist 폴더를 Netlify Drop에 드래그
```

### 3. 완료! 🎉
```
Frontend URL에서 접속
→ 시뮬레이션 시작
→ AI 에이전트 작동 확인
```

---

## 📞 도움이 필요하신가요?

- 빠른 배포: [QUICK_DEPLOY.md](QUICK_DEPLOY.md)
- 상세 가이드: [FULL_DEPLOY_GUIDE.md](FULL_DEPLOY_GUIDE.md)
- 문제 해결: [TROUBLESHOOTING.md](TROUBLESHOOTING.md)
- Docker 배포: [README.docker.md](README.docker.md)

---

## 💡 팁

- 첫 배포는 10분 정도 소요됩니다
- Backend는 첫 요청 시 30초 정도 걸릴 수 있습니다 (Free tier)
- Frontend는 즉시 로드됩니다
- 업데이트는 git push만으로 자동 배포됩니다

---

**Happy Deploying! 🚀**
