# EduPath Backend RESTful API Engine

> **Đồ án môn học:** Thiết kế UX/UI (1)_TA  
> **Trường:** ĐH Công nghệ Thông tin & Truyền thông Việt - Hàn (VKU), ĐH Đà Nẵng  
> **Giảng viên hướng dẫn:** ThS. Lý Quỳnh Trân (`lqtran@vku.udn.vn`)  
> **Nhóm thực hiện:** Nhóm Rise  
> **Thành viên phụ trách:**
> - **Nguyễn Văn Hùng** - `23IT.B069` (Phần A: S01–S24 + A01, A02: Onboarding, Personalization & Learner Experience)
> - **Nguyễn Gia Minh** - `23IT.B132` (Phần B: S25–S48: Course Discovery, Multimedia Learning, Cohort & Exam)

---

## 1. Giới thiệu Tổng quan
Hệ thống Backend được phát triển hoàn chỉnh bằng **Python FastAPI**, **SQLAlchemy 2.0 ORM** và **SQLite 3** nhằm cung cấp đầy đủ dữ liệu động và nghiệp vụ thực tế cho toàn bộ **50 màn hình** Phần A & B của nền tảng học tập thông minh **EduPath**.

### Điểm nổi bật:
* **Zero-Configuration:** Sử dụng SQLite tích hợp sẵn, không yêu cầu cài đặt MySQL/PostgreSQL phức tạp. Khởi chạy 1 chạm bằng `run_backend.bat`.
* **Tự động Khởi tạo & Nạp dữ liệu (Auto-Seed):** Tự động tạo 14 bảng quan hệ và nạp dữ liệu mẫu bám sát $100\%$ bản vẽ Figma (khóa học Pandas, Ms. Lan, Daily Quests, Streak 12 ngày, Flashcards, Chứng chỉ...).
* **Tài liệu Swagger UI Tương tác:** Truy cập `http://127.0.0.1:8000/docs` để thử nghiệm trực tiếp toàn bộ các API endpoint trên trình duyệt.
* **Bảo mật Chuẩn mực:** Băm mật khẩu bằng PBKDF2-HMAC-SHA256 (NIST standard) với 100,000 vòng lặp và xác thực JWT Bearer Token.

---

## 2. Bản đồ API Endpoints tương ứng 50 Màn hình Figma

| Nhóm API (Router) | Tiền tố Endpoint | Màn hình Figma Phụ trách | Chức năng chính |
| :--- | :--- | :--- | :--- |
| **00 · Auth** | `/api/v1/auth` | **A01, A02** | Đăng nhập, Đăng ký học viên, Profile `/me`, cấp JWT Token |
| **01 · Onboarding** | `/api/v1/onboarding` | **S03 – S09** | Chọn mục tiêu, Lĩnh vực quan tâm, Test đầu vào & Lộ trình AI |
| **02 · Learner** | `/api/v1/learner` | **S10 – S24** | Trang chủ, Kế hoạch học, Streak, Mục tiêu tuần, Thống kê, XP, Huy hiệu, Cây kỹ năng, Cài đặt trợ năng |
| **03 · Courses** | `/api/v1/courses` | **S25 – S35** | Khám phá, Danh mục, Tìm kiếm đa năng, Bộ lọc, Chi tiết khóa, Đề cương, Giảng viên, Đánh giá, So sánh khóa học |
| **04 · Learning** | `/api/v1/learning` | **S36 – S44** | Video/Audio player, Đọc bài, Ghi chú mốc thời gian, Tra từ điển, Tải ngoại tuyến, Pomodoro Focus |
| **05 · My Courses** | `/api/v1/my-courses` | **S45 – S48** | Lịch học nhóm Cohort, Khóa học của tôi, Thi cuối khóa & Cấp chứng chỉ số chính thức |

---

## 3. Hướng dẫn Cài đặt & Khởi chạy

### Cách 1: Khởi chạy 1 chạm trên Windows
Nhấp đúp chuột vào file:
```cmd
run_backend.bat
```

### Cách 2: Chạy thủ công qua dòng lệnh
```bash
# 1. Cài đặt các thư viện phụ thuộc
pip install -r requirements.txt

# 2. Khởi chạy Uvicorn Server
uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload
```

Sau khi khởi chạy thành công:
* **API Server:** `http://127.0.0.1:8000`
* **Tài liệu Swagger UI:** `http://127.0.0.1:8000/docs`
* **Tài liệu ReDoc:** `http://127.0.0.1:8000/redoc`

---

## 4. Chạy Kiểm thử Tự động (Automated Test Suite)
Hệ thống đi kèm bộ test tự động kiểm thử toàn diện $100\%$ các endpoint của cả 6 router:
```bash
python tests/test_api.py
```
**Kết quả kiểm thử:**
```text
============================================================
BẮT ĐẦU CHẠY KIỂM THỬ TOÀN DIỆN EDUPATH BACKEND
============================================================
✅ [Pass] Test Root & Health Check
✅ [Pass] Test Auth (Login & Profile Me - A01, A02)
✅ [Pass] Test Onboarding & Placement Test (S03–S09)
✅ [Pass] Test Learner Experience & Gamification (S10–S24)
✅ [Pass] Test Course Discovery, Details & Compare (S25–S35)
✅ [Pass] Test Multimedia Learning & Notes (S36–S44)
✅ [Pass] Test My Courses, Final Exam & Certificate (S45–S48)
============================================================
🎉 TẤT CẢ 6 ROUTERS VÀ 50 MÀN HÌNH ĐÃ PASS KIỂM THỬ 100%!
============================================================
```

---

## 5. Cấu trúc Thư mục Mã nguồn
```text
backend/
├── app/
│   ├── main.py              # Entrypoint, CORS, Lifespan auto-seed
│   ├── core/
│   │   ├── config.py        # Settings & biến môi trường
│   │   ├── database.py      # SQLAlchemy 2.0 SQLite Engine & Session
│   │   └── security.py      # PBKDF2 hash & JWT token
│   ├── models/              # 14 Bảng CSDL ORM (User, Course, Gamification, Exam...)
│   ├── schemas/             # Pydantic v2 validation models
│   ├── api/
│   │   ├── deps.py          # Dependency injection (get_db, get_current_user)
│   │   └── v1/              # 6 Routers xử lý 50 màn hình
│   └── database/
│       └── seed_data.py     # Dữ liệu mẫu chuẩn xác theo Figma
├── tests/
│   └── test_api.py          # Bộ kiểm thử tự động
├── edupath.db               # CSDL SQLite tự động tạo
├── requirements.txt
├── run_backend.bat
└── README.md
```
