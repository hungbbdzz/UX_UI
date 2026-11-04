# Hướng Dẫn Sử Dụng API Endpoints (API Specification)

> **Dự án:** EduPath Platform - RESTful API Specification  
> **Máy chủ Local:** `http://127.0.0.1:8000`  
> **Swagger UI:** `http://127.0.0.1:8000/docs`

---

## 1. Nhóm Xác Thực & Tài Khoản (`/api/v1/auth`)

| Phương thức | Đường dẫn Endpoint | Màn hình | Mô tả |
| :---: | :--- | :---: | :--- |
| `POST` | `/api/v1/auth/register` | **A02** | Đăng ký tài khoản học viên mới, tự động khởi tạo Profile & Settings |
| `POST` | `/api/v1/auth/login` | **A01** | Đăng nhập hệ thống, trả về access token JWT |
| `GET` | `/api/v1/auth/me` | **A01, S18** | Lấy thông tin tài khoản và profile của người dùng hiện tại |

---

## 2. Nhóm Khảo Sát Onboarding & Kiểm Tra Đầu Vào (`/api/v1/onboarding`)

| Phương thức | Đường dẫn Endpoint | Màn hình | Mô tả |
| :---: | :--- | :---: | :--- |
| `GET` | `/api/v1/onboarding/goals` | **S03** | Lấy danh mục các mục tiêu học tập (Chuyển ngành, Thăng tiến...) |
| `GET` | `/api/v1/onboarding/interests` | **S04** | Lấy danh sách lĩnh vực quan tâm (Python, UI/UX, Web, English...) |
| `GET` | `/api/v1/onboarding/levels` | **S05** | Danh mục 3 trình độ đầu vào (Beginner, Intermediate, Advanced) |
| `GET` | `/api/v1/onboarding/study-times` | **S06** | Các mốc thời gian cam kết học mỗi ngày (15, 30, 45, 60 phút) |
| `GET` | `/api/v1/onboarding/placement-questions` | **S07** | Đề thi trắc nghiệm đánh giá năng lực đầu vào |
| `POST` | `/api/v1/onboarding/placement-test/submit` | **S08** | Nộp bài thi, chấm điểm và xếp lớp trình độ tự động |
| `GET` | `/api/v1/onboarding/suggested-paths` | **S09** | Danh sách các lộ trình học tập cá nhân hóa do AI gợi ý |
| `POST` | `/api/v1/onboarding/preferences` | **S03–S06** | Lưu toàn bộ lựa chọn khảo sát vào Profile học viên |

---

## 3. Nhóm Trang Chủ & Gamification (`/api/v1/learner`)

| Phương thức | Đường dẫn Endpoint | Màn hình | Mô tả |
| :---: | :--- | :---: | :--- |
| `GET` | `/api/v1/learner/home` | **S10** | Dữ liệu trang chủ: Quests, Streak, Quick categories, Gợi ý khóa học |
| `GET` | `/api/v1/learner/study-plan` | **S11** | Danh sách nhiệm vụ học tập cần hoàn thành trong ngày |
| `POST` | `/api/v1/learner/study-plan/{id}/toggle`| **S11** | Đánh dấu hoàn thành / chưa hoàn thành bài học hôm nay |
| `GET` | `/api/v1/learner/streak` | **S12** | Chi tiết chuỗi ngày học, số lượt bảo vệ Freeze và lịch học tháng |
| `POST` | `/api/v1/learner/streak/freeze` | **S12** | Kích hoạt vật phẩm bảo vệ chuỗi Freeze Streak |
| `GET` | `/api/v1/learner/weekly-goals` | **S13** | Mục tiêu giờ học tuần này vs số giờ thực tế đã học |
| `GET` | `/api/v1/learner/statistics` | **S14** | Thống kê tổng giờ học, tỷ lệ hoàn thành khóa học và xu hướng tuần |
| `GET` | `/api/v1/learner/badges` | **S15** | Bộ sưu tập huy hiệu thành tích đã mở khóa và còn khóa |
| `GET` | `/api/v1/learner/level-xp` | **S16** | Cấp độ hiện tại, điểm XP tích lũy và mốc thăng cấp tiếp theo |
| `GET` | `/api/v1/learner/daily-quests` | **S17** | Danh sách nhiệm vụ hàng ngày (Học 20 phút, Giải 1 Quiz...) |
| `POST` | `/api/v1/learner/daily-quests/{id}/claim`| **S17** | Nhận điểm kinh nghiệm XP thưởng khi nhiệm vụ hoàn thành |
| `GET` | `/api/v1/learner/profile` | **S18** | Chi tiết hồ sơ cá nhân học viên |
| `PUT` | `/api/v1/learner/profile` | **S19** | Chỉnh sửa tên, bio, avatar, số điện thoại |
| `GET` | `/api/v1/learner/skill-tree` | **S20** | Danh sách các node kỹ năng trong Cây kỹ năng năng lực |
| `GET` | `/api/v1/learner/share-card` | **S21** | Lấy dữ liệu thẻ chia sẻ thành tích lên mạng xã hội |
| `GET` | `/api/v1/learner/settings` | **S22–S24**| Cài đặt học tập, giờ nhắc nhở và tùy chọn trợ năng hiển thị |
| `PUT` | `/api/v1/learner/settings` | **S22–S24**| Cập nhật tùy chọn hiển thị và học tập |

---

## 4. Nhóm Khám Phá & Khóa Học (`/api/v1/courses`)

| Phương thức | Đường dẫn Endpoint | Màn hình | Mô tả |
| :---: | :--- | :---: | :--- |
| `GET` | `/api/v1/courses/explore` | **S25** | Banners quảng bá, khóa học thịnh hành, giảng viên tiêu biểu |
| `GET` | `/api/v1/courses/categories` | **S26** | Danh mục khóa học phân cấp (Python, UI/UX, English...) |
| `GET` | `/api/v1/courses/search` | **S27, S29**| Tìm kiếm khóa học theo từ khóa, danh mục, giá, sao và sắp xếp |
| `GET` | `/api/v1/courses/filters` | **S28** | Danh sách các tiêu chí trong bộ lọc nâng cao |
| `GET` | `/api/v1/courses/{id}` | **S30** | Chi tiết khóa học: Giảng viên, giá tiền, đề cương và review |
| `GET` | `/api/v1/courses/{id}/syllabus` | **S31** | Toàn bộ các chương và bài học chi tiết của khóa |
| `GET` | `/api/v1/courses/instructors/{id}` | **S32** | Hồ sơ giảng viên, đánh giá và các khóa học đang dạy |
| `GET` | `/api/v1/courses/{id}/reviews` | **S33** | Danh sách nhận xét của học viên kèm phân bố sao |
| `POST` | `/api/v1/courses/{id}/reviews` | **S33** | Gửi nhận xét và chấm sao cho khóa học |
| `GET` | `/api/v1/courses/compare` | **S34** | So sánh đa chiều giữa 2 hoặc nhiều khóa học |
| `GET` | `/api/v1/courses/lessons/{id}/preview`| **S35** | Học thử bài học miễn phí trước khi quyết định đăng ký |

---

## 5. Nhóm Học Đa Phương Tiện & Trợ Giúp (`/api/v1/learning`)

| Phương thức | Đường dẫn Endpoint | Màn hình | Mô tả |
| :---: | :--- | :---: | :--- |
| `GET` | `/api/v1/learning/lessons/{id}` | **S36–S39, S43** | Trình phát bài học (Video, Audio podcast, Markdown, Slide PDF) |
| `POST` | `/api/v1/learning/lessons/{id}/progress`| **S36–S39** | Cập nhật số giây đang học và đánh dấu tích xanh hoàn thành |
| `GET` | `/api/v1/learning/lessons/{id}/notes` | **S40** | Lấy danh sách ghi chú gắn mốc thời gian video |
| `POST` | `/api/v1/learning/lessons/{id}/notes` | **S40** | Tạo ghi chú mới tại mốc giây video hiện tại |
| `GET` | `/api/v1/learning/glossary` | **S41** | Từ điển tra cứu thuật ngữ chuyên ngành IT & Thiết kế |
| `GET` | `/api/v1/learning/offline-downloads` | **S42** | Quản lý các bài học đã tải xuống ngoại tuyến |
| `POST` | `/api/v1/learning/offline-downloads/{id}`| **S42** | Tải bài học về lưu trữ offline |
| `POST` | `/api/v1/learning/focus-session` | **S44** | Ghi nhận phiên tập trung Pomodoro và cộng điểm thưởng XP |

---

## 6. Nhóm Học Nhóm & Chứng Chỉ Số (`/api/v1/my-courses`)

| Phương thức | Đường dẫn Endpoint | Màn hình | Mô tả |
| :---: | :--- | :---: | :--- |
| `GET` | `/api/v1/my-courses/cohorts` | **S45** | Lịch học nhóm hàng tuần có mentor hướng dẫn |
| `GET` | `/api/v1/my-courses/enrolled` | **S46** | Danh sách khóa học của tôi (Đang học, Đã hoàn thành) |
| `POST` | `/api/v1/my-courses/enroll/{id}` | **S30, S46** | Đăng ký khóa học mới |
| `GET` | `/api/v1/my-courses/{id}/progress` | **S47** | Tiến độ học tập chi tiết từng bài và điều kiện thi cuối khóa |
| `GET` | `/api/v1/my-courses/{id}/final-quiz` | **S47** | Đề thi trắc nghiệm đánh giá năng lực cuối khóa |
| `POST` | `/api/v1/my-courses/{id}/final-quiz/submit`| **S47** | Nộp bài thi cuối khóa, chấm điểm tự động |
| `GET` | `/api/v1/my-courses/{id}/certificate`| **S47** | Xem và tải chứng chỉ số tốt nghiệp chính thức |
| `GET` | `/api/v1/my-courses/{id}/next-recommendations`| **S48** | Gợi ý các khóa học chuyên sâu tiếp theo sau khi tốt nghiệp |

