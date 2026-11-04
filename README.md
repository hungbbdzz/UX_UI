# EduPath — AI Learning Experience Platform

<div align="center">

![Platform Badge](https://img.shields.io/badge/Platform-Mobile%20%7C%20Web-005696?style=for-the-badge)
![FastAPI Badge](https://img.shields.io/badge/Backend-FastAPI_v2.0-009688?style=for-the-badge&logo=fastapi)
![Flutter Badge](https://img.shields.io/badge/Frontend-Flutter_3.x-02569B?style=for-the-badge&logo=flutter)
![React Native Badge](https://img.shields.io/badge/Mobile-React_Native-61DAFB?style=for-the-badge&logo=react)
![Python Badge](https://img.shields.io/badge/Python-3.12-3776AB?style=for-the-badge&logo=python)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

### **Enterprise E-Learning Mobile & Web Ecosystem**
*Nền tảng học tập thông minh với 50 màn hình chuẩn thiết kế, Backend RESTful API và Trình mô phỏng tương tác cao.*

</div>

---

## 📱 Phạm Vi Hệ Thống (50 Màn Hình Trải Nghiệm)

| Phân Hệ | Phạm Vi Màn Hình | Tính Năng Trọng Tâm |
| :--- | :---: | :--- |
| **Phần A: Learner Experience & Onboarding** | `S01` – `S24`, `A01`, `A02` (26 màn hình) | Onboarding, Khảo sát mục tiêu, Đánh giá đầu vào, Trang chủ, Streak, Nhiệm vụ ngày, Hồ sơ |
| **Phần B: Course Discovery & Multimedia** | `S25` – `S48` (24 màn hình) | Khám phá khóa học, Tìm kiếm nâng cao, Đề cương, Trình phát đa phương tiện, Thi & Chứng chỉ |

---

## 🏗️ Cấu Trúc Monorepo Chuẩn Sản Phẩm

```text
UX_UI/ (final/figmatoCode)
├── backend/                        # Hệ thống RESTful API hoàn chỉnh (FastAPI)
│   ├── app/
│   │   ├── main.py                 # Entrypoint, CORS, Lifespan auto-seed
│   │   ├── core/                   # Cấu hình Config, Database, PBKDF2/JWT Security
│   │   ├── models/                 # 14 Bảng CSDL SQLAlchemy 2.0 ORM
│   │   ├── schemas/                # Pydantic v2 Request/Response validation
│   │   ├── api/v1/                 # 6 Routers xử lý 50 màn hình
│   │   └── database/seed_data.py   # Dữ liệu mẫu chuẩn 100% bản vẽ Figma
│   ├── tests/test_api.py           # Bộ kiểm thử tự động toàn bộ 6 Routers
│   ├── requirements.txt            # Thư viện phụ thuộc
│   ├── run_backend.bat             # Chạy 1 chạm trên Windows
│   └── README.md                   # Hướng dẫn chi tiết cho Backend
├── frontend/                       # Tầng Giao diện người dùng
│   ├── flutter/                    # 50 Màn hình Flutter + DTO + ApiService
│   ├── react_native/               # 50 Màn hình React Native + TypeScript
│   └── web_viewer/                 # Trình mô phỏng iPhone 13 Pro Max Web Prototype
│       ├── index.html              # Web Simulator tương tác động
│       ├── images/                 # Ảnh màn hình bóc tách pixel-perfect
│       └── prototype_graph.json    # Đồ thị tương tác 50 màn hình + 15 luồng Figma
├── docs/                           # Tài liệu kỹ thuật nộp giảng viên
│   ├── system_architecture.md      # Sơ đồ kiến trúc & phân tầng
│   ├── api_endpoints_guide.md      # Đặc tả chi tiết từng API Endpoint
│   └── database_erd.md             # Sơ đồ CSDL quan hệ thực thể (ERD)
├── tools/                          # Bộ công cụ bóc tách Figma (Figma Engine)
├── .gitignore                      # Bộ lọc file rác chuẩn Git
└── README.md                       # Trang chủ dự án
```

---

## ⚡ Hướng Dẫn Khởi Chạy Nhanh

### 1. Khởi chạy Backend FastAPI (SQLite Auto-Seed)
```bash
cd backend

# Cách 1: Chạy 1 chạm trên Windows
run_backend.bat

# Cách 2: Chạy qua Uvicorn CLI
pip install -r requirements.txt
uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload
```
* **API Server:** `http://127.0.0.1:8000`
* **Swagger UI Tương tác:** `http://127.0.0.1:8000/docs`
* **ReDoc:** `http://127.0.0.1:8000/redoc`

### 2. Mở Trình Mô Phỏng Prototype (Web Simulator)
Mở trực tiếp file sau bằng trình duyệt (Chrome / Edge / Firefox):
```text
frontend/web_viewer/index.html
```
* Khung điện thoại mô phỏng chính xác kích thước và viền **iPhone 13 Pro Max** (tai thỏ Dynamic Notch, bo góc squircle $R=50\text{px}$, thanh iOS Home Indicator).
* Hỗ trợ chạm trực tiếp vào nút bấm trên màn hình điện thoại hoặc chọn theo kịch bản luồng chạy.

---

## 🧪 Kết Quả Kiểm Thử Tự Động (Automated Testing)

Chạy lệnh kiểm thử toàn diện:
```bash
python backend/tests/test_api.py
```

**Kết quả:**
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

## 🔗 Hướng Dẫn Git Push Lên GitHub

Repository đích: **[https://github.com/hungbbdzz/UX_UI](https://github.com/hungbbdzz/UX_UI)**

```bash
cd "C:\Documents\Materials\UX UI\final\figmatoCode"

# 1. Khởi tạo kho Git (nếu chưa khởi tạo)
git init

# 2. Thêm remote repository của bạn Hùng
git remote add origin https://github.com/hungbbdzz/UX_UI.git

# 3. Thêm toàn bộ mã nguồn
git add .

# 4. Commit phiên bản hoàn chỉnh
git commit -m "feat: complete Full-Stack EduPath (Frontend 50 screens + FastAPI Backend + SQLite Seed + Docs)"

# 5. Đẩy lên nhánh main
git branch -M main
git push -u origin main
```

---

<div align="center">
  <b>EduPath Platform © 2026 — Open Source Project</b>
</div>
