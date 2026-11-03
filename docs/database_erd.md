# Sơ Đồ Cơ Sở Dữ Liệu Quan Hệ (Database ERD)

> **Cơ sở dữ liệu:** SQLite 3 với SQLAlchemy 2.0 ORM  
> **Tổng số bảng thực thể:** 14 bảng quan hệ  
> **Dự án:** EduPath Platform - Đồ án UX/UI Nhóm Rise (VKU - GV ThS. Lý Quỳnh Trân)

---

## 1. Sơ đồ Quan hệ Thực thể (Mermaid ERD)

```mermaid
erDiagram
    users ||--o| learner_profiles : "has"
    users ||--o| user_settings : "has"
    users ||--o{ daily_quests : "tracks"
    users ||--o{ study_streak_logs : "records"
    users ||--o{ user_badges : "earns"
    users ||--o{ course_enrollments : "enrolls"
    users ||--o{ user_lesson_progress : "progresses"
    users ||--o{ timestamped_notes : "writes"
    users ||--o{ certificates : "receives"

    categories ||--o{ courses : "contains"
    instructors ||--o{ courses : "teaches"
    courses ||--o{ course_sections : "divided_into"
    course_sections ||--o{ lessons : "contains"
    courses ||--o{ course_reviews : "receives"
    courses ||--o{ cohort_schedules : "schedules"
    courses ||--o{ final_quizzes : "has"

    final_quizzes ||--o{ final_quiz_questions : "contains"
    badges ||--o{ user_badges : "awarded_in"

    users {
        int id PK
        string email UK
        string full_name
        string hashed_password
        string role
        boolean is_active
        datetime created_at
    }

    learner_profiles {
        int id PK
        int user_id FK
        string avatar_url
        text bio
        string current_level
        int daily_study_minutes
        int xp
        int level
        int streak_count
        int longest_streak
        int freeze_streak_count
        float total_study_hours
        int courses_completed
        int certificates_count
    }

    courses {
        int id PK
        string title
        string slug UK
        int category_id FK
        int instructor_id FK
        string thumbnail_url
        int price
        int original_price
        boolean is_free
        string level
        float duration_hours
        int total_lessons
        float rating
        int reviews_count
        int students_enrolled
    }

    lessons {
        int id PK
        int section_id FK
        string title
        string lesson_type
        int duration_minutes
        string video_url
        string audio_url
        text reading_content
        string slide_url
        boolean is_preview
        int order_index
    }

    certificates {
        int id PK
        int user_id FK
        int course_id FK
        string certificate_code UK
        string student_name
        string course_title
        string instructor_name
        date issued_date
        string final_grade
        string verification_url
    }
```

---

## 2. Chi tiết 14 Bảng CSDL

1. **`users`**: Tài khoản người dùng (Email, Password Hash, Họ tên, Role).
2. **`learner_profiles`**: Hồ sơ học viên, chỉ số gamification (XP, Level, Streak, Freeze).
3. **`user_settings`**: Tùy chọn trợ năng (Dark mode, Cỡ chữ, Tự động phát, Giờ nhắc học).
4. **`learning_goals`**: Danh mục mục tiêu học tập (S03).
5. **`interests`**: Danh mục lĩnh vực sở thích (S04).
6. **`placement_questions`**: Ngân hàng câu hỏi trắc nghiệm kiểm tra đầu vào (S07).
7. **`suggested_paths`**: Lộ trình gợi ý cá nhân hóa do hệ thống đề xuất (S09).
8. **`categories`**: Danh mục phân cấp các khóa học (S26).
9. **`instructors`**: Hồ sơ giảng viên, đánh giá và kinh nghiệm (S32).
10. **`courses`**: Bảng dữ liệu khóa học đầy đủ thông số (S25, S27–S30, S34).
11. **`course_sections` & `lessons`**: Cấu trúc chương mục và bài học đa phương tiện (S31, S35–S39).
12. **`daily_quests`**: Nhiệm vụ hàng ngày kèm tiến độ và thưởng XP (S10, S17).
13. **`course_enrollments`**: Quản lý việc ghi danh khóa học và % hoàn thành (S46, S47).
14. **`certificates`**: Chứng chỉ số tốt nghiệp có mã tra cứu chính thức (S47, S48).
