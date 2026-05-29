# HMM 채용사이트

Vue 3 프론트엔드, Java(Spring Boot) 백엔드, PostgreSQL 데이터베이스로 구성한 채용 플랫폼입니다.

## 기술 스택

| 영역 | 기술 |
|------|------|
| Frontend | Vue 3, Vite |
| Backend | Java 17, Spring Boot 3.3, Spring Data JPA |
| Database | PostgreSQL 16 |

## 프로젝트 구조

```
HMM_PJ/
├── database/init.sql      # DB 스키마 + 샘플 데이터
├── docker-compose.yml     # PostgreSQL
├── backend/               # Spring Boot API
├── frontend/              # Vue 첫 페이지
└── scripts/               # GitHub 연결 스크립트
```

## 실행 방법

### 1. PostgreSQL

```bash
docker compose up -d
```

### 2. 백엔드 (Java 17+, Maven)

```bash
cd backend
mvn spring-boot:run
```

→ http://localhost:8080

### 3. 프론트엔드 (Node.js 18+)

```bash
cd frontend
npm install
npm run dev
```

→ http://localhost:5173

## API

| Method | Path | 설명 |
|--------|------|------|
| GET | `/api/jobs/featured` | 추천 채용공고 |
| GET | `/api/home/stats` | 홈 통계 |

## GitHub 연결

```powershell
.\scripts\connect-github.ps1 -RepoUrl "https://github.com/사용자명/저장소명.git"
git push -u origin main
```

## DB 접속

- Host: `localhost:5432`
- Database: `recruit_db`
- User: `recruit` / Password: `recruit123`
