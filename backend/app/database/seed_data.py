# -*- coding: utf-8 -*-
"""
EduPath Backend - Seed Data Nạp dữ liệu mẫu ban đầu
"""

from datetime import date, datetime, timedelta, timezone
from sqlalchemy.orm import Session

from app.core.security import get_password_hash
from app.models.user import User, LearnerProfile, UserSettings
from app.models.onboarding import (
    LearningGoal,
    Interest,
    PlacementQuestion,
    SuggestedPath,
    UserOnboardingState
)
from app.models.gamification import (
    DailyQuest,
    StudyPlanItem,
    StudyStreakLog,
    WeeklyGoalLog,
    Badge,
    UserBadge,
    SkillNode
)
from app.models.course import (
    Category,
    Instructor,
    Course,
    CourseSection,
    Lesson,
    CourseReview
)
from app.models.learning import (
    UserLessonProgress,
    TimestampedNote,
    GlossaryTerm,
    OfflineDownload
)
from app.models.cohort_exam import (
    CohortSchedule,
    CourseEnrollment,
    FinalQuiz,
    FinalQuizQuestion,
    Certificate
)

def seed_database(db: Session):
    """Kiểm tra và tự động nạp dữ liệu mẫu ban đầu nếu CSDL chưa có dữ liệu"""
    if db.query(User).first():
        print("[*] Cơ sở dữ liệu đã có dữ liệu mẫu. Bỏ qua bước seed.")
        return

    print("[*] Đang khởi tạo và nạp dữ liệu mẫu cho EduPath Backend...")

    # 1. TẠO TÀI KHOẢN NGƯỜI DÙNG & PROFILE
    # Học viên 1
    hung_user = User(
        email="hung.nv@edupath.vn",
        full_name="Nguyễn Văn Hùng",
        hashed_password=get_password_hash("EduPath2026!"),
        role="learner",
        is_active=True
    )
    db.add(hung_user)
    db.flush()

    hung_profile = LearnerProfile(
        user_id=hung_user.id,
        avatar_url="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=200",
        bio="Học viên đam mê UX/UI Design & Lập trình ứng dụng",
        phone="0905123456",
        current_level="Intermediate",
        daily_study_minutes=30,
        xp=1250,
        level=5,
        streak_count=12,
        longest_streak=24,
        freeze_streak_count=2,
        total_study_hours=48.5,
        courses_completed=3,
        certificates_count=2
    )
    db.add(hung_profile)

    hung_settings = UserSettings(
        user_id=hung_user.id,
        auto_play_video=True,
        default_subtitles="vi",
        playback_speed=1.0,
        daily_reminder_enabled=True,
        reminder_time="20:00",
        dark_mode=True,
        font_size="medium"
    )
    db.add(hung_settings)

    # Học viên 2
    minh_user = User(
        email="minh.ng@edupath.vn",
        full_name="Nguyễn Gia Minh",
        hashed_password=get_password_hash("EduPath2026!"),
        role="learner",
        is_active=True
    )
    db.add(minh_user)
    db.flush()

    minh_profile = LearnerProfile(
        user_id=minh_user.id,
        avatar_url="https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?w=200",
        bio="Thành viên EduPath - Khám phá khóa học & Đa phương tiện",
        current_level="Intermediate",
        daily_study_minutes=45,
        xp=1100,
        level=4,
        streak_count=10,
        longest_streak=18,
        freeze_streak_count=1,
        total_study_hours=36.0,
        courses_completed=2,
        certificates_count=1
    )
    db.add(minh_profile)
    db.add(UserSettings(user_id=minh_user.id))

    # Giảng viên
    instructor_user = User(
        email="instructor@edupath.vn",
        full_name="Dr. Minh Tran",
        hashed_password=get_password_hash("EduPath2026!"),
        role="instructor",
        is_active=True
    )
    db.add(instructor_user)

    # 2. ONBOARDING: GOALS & INTERESTS (S03, S04)
    goals = [
        LearningGoal(code="career_switch", title="Chuyển ngành sang Tech & UX", description="Học từ số 0 để trở thành Product Designer hoặc Frontend Dev", icon="work", popularity_rank=1),
        LearningGoal(code="upskill", title="Nâng cao kỹ năng thăng tiến", description="Làm chủ Design System, Figma Variables và Data Analysis", icon="trending_up", popularity_rank=2),
        LearningGoal(code="study_abroad", title="Chuẩn bị du học & Chứng chỉ", description="Đạt chứng chỉ quốc tế uy tín và tiếng Anh chuyên ngành", icon="school", popularity_rank=3),
        LearningGoal(code="passion", title="Học vì sở thích & Dự án cá nhân", description="Tự xây dựng ứng dụng hoặc website theo ý tưởng riêng", icon="favorite", popularity_rank=4)
    ]
    db.add_all(goals)

    interests = [
        Interest(code="python", name="Python", category="Technology", icon="terminal", badge_color="#3B82F6"),
        Interest(code="english", name="English A2", category="Languages", icon="language", badge_color="#10B981"),
        Interest(code="uiux", name="UI/UX", category="Design", icon="palette", badge_color="#F59E0B"),
        Interest(code="data", name="Data Science", category="Technology", icon="analytics", badge_color="#8B5CF6"),
        Interest(code="web", name="Web Dev", category="Technology", icon="web", badge_color="#EC4899"),
        Interest(code="mobile", name="Mobile Flutter", category="Technology", icon="smartphone", badge_color="#06B6D4")
    ]
    db.add_all(interests)

    # 3. ONBOARDING: PLACEMENT QUESTIONS (S07)
    placement_questions = [
        PlacementQuestion(
            category="UI/UX Design",
            question_text="Trong thiết kế giao diện theo nguyên lý Hierarchy, yếu tố nào quan trọng nhất để dẫn dắt mắt người dùng trước tiên?",
            options=["Kích thước và độ tương phản của chữ (Font Size & Weight)", "Màu nền của màn hình", "Số lượng biểu tượng trong trang", "Độ dày viền của nút bấm"],
            correct_option_index=0,
            explanation="Kích thước và độ tương phản là phương thức hiệu quả nhất để thiết lập thị giác phân cấp (Visual Hierarchy).",
            difficulty_level="Medium"
        ),
        PlacementQuestion(
            category="Python Programming",
            question_text="Trong cấu trúc dữ liệu Python, kiểu dữ liệu nào sau đây là 'immutable' (không thể thay đổi giá trị sau khi tạo)?",
            options=["List", "Tuple", "Dictionary", "Set"],
            correct_option_index=1,
            explanation="Tuple trong Python là cấu trúc dữ liệu bất biến (immutable).",
            difficulty_level="Easy"
        ),
        PlacementQuestion(
            category="UX Usability",
            question_text="Định luật Fitts trong thiết kế trải nghiệm người dùng nhấn mạnh điều gì?",
            options=[
                "Thời gian cần để chạm vào mục tiêu phụ thuộc vào khoảng cách và kích thước mục tiêu",
                "Người dùng dành phần lớn thời gian trên các trang web khác",
                "Bộ nhớ ngắn hạn của con người chỉ nhớ được 7 ± 2 mục",
                "Đơn giản hóa giao diện luôn luôn làm giảm tính năng"
            ],
            correct_option_index=0,
            explanation="Định luật Fitts: Target càng to và càng gần ngón tay cái thì thao tác càng nhanh và chính xác.",
            difficulty_level="Hard"
        )
    ]
    db.add_all(placement_questions)

    # 4. SUGGESTED PATHS (S09)
    suggested_paths = [
        SuggestedPath(
            title="Lộ trình Product Designer & Data-Driven UX",
            target_role="Junior Product Designer",
            total_weeks=12,
            description="Lộ trình toàn diện kết hợp tư duy thiết kế trải nghiệm người dùng với khả năng phân tích dữ liệu sản phẩm.",
            match_score=95,
            milestones=[
                {"phase": 1, "weeks": "Tuần 1 - 3", "title": "Nền tảng Thiết kế UX & Wireframe", "skills": "Figma, User Flow, Information Architecture"},
                {"phase": 2, "weeks": "Tuần 4 - 8", "title": "Design System & Prototyping nâng cao", "skills": "Auto Layout, Variables, Component Sets, Tokens"},
                {"phase": 3, "weeks": "Tuần 9 - 12", "title": "Data-Driven UX & Tốt nghiệp", "skills": "A/B Testing, Pandas Analytics, Final Capstone"}
            ]
        ),
        SuggestedPath(
            title="Lộ trình Full-Stack Web & Mobile App",
            target_role="Full-Stack Junior Developer",
            total_weeks=16,
            description="Từ giao diện Flutter/React đến tầng xử lý Backend FastAPI và CSDL quan hệ.",
            match_score=88,
            milestones=[
                {"phase": 1, "weeks": "Tuần 1 - 4", "title": "Lập trình ứng dụng di động", "skills": "Flutter, Dart, Responsive UI"},
                {"phase": 2, "weeks": "Tuần 5 - 10", "title": "Backend RESTful API", "skills": "Python FastAPI, SQLAlchemy, SQLite"},
                {"phase": 3, "weeks": "Tuần 11 - 16", "title": "Tích hợp hệ thống & Bảo mật", "skills": "JWT Auth, Cloud Deploy, Testing"}
            ]
        )
    ]
    db.add_all(suggested_paths)

    # 5. CATEGORIES & INSTRUCTORS (S26, S32)
    categories = [
        Category(name="Python & Data", slug="python-data", icon="code", color="#3B82F6", courses_count=12, is_featured=True),
        Category(name="UI/UX Design", slug="ui-ux-design", icon="palette", color="#F59E0B", courses_count=18, is_featured=True),
        Category(name="English A2", slug="english-a2", icon="language", color="#10B981", courses_count=8, is_featured=True),
        Category(name="Web & Mobile", slug="web-mobile", icon="smartphone", color="#8B5CF6", courses_count=15, is_featured=True)
    ]
    db.add_all(categories)
    db.flush()

    instructors = [
        Instructor(
            name="Ms. Lan",
            title="Senior UI/UX & Data Specialist",
            organization="Tech Academy & Innovation Hub",
            avatar_url="https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=200",
            bio="Hơn 8 năm kinh nghiệm thực chiến trong các dự án công nghệ lớn và giảng dạy chuyên sâu tại Đà Nẵng.",
            total_students=14200,
            average_rating=4.9,
            total_courses=6
        ),
        Instructor(
            name="Dr. Minh Tran",
            title="Senior UX & System Architecture Advisor",
            organization="Global Tech Institute",
            avatar_url="https://images.unsplash.com/photo-1580894732444-8ecded7900cd?w=200",
            bio="Chuyên gia nghiên cứu về Human-Computer Interaction và Trải nghiệm người dùng.",
            total_students=8500,
            average_rating=5.0,
            total_courses=4
        )
    ]
    db.add_all(instructors)
    db.flush()

    # 6. COURSES & LESSONS (Trùng khớp 100% Text trên Figma S10, S25, S30)
    c1 = Course(
        title="Applied Data Wrangling with Pandas",
        slug="applied-data-wrangling-pandas",
        category_id=categories[0].id,
        instructor_id=instructors[0].id,
        thumbnail_url="https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=600",
        price=0,
        original_price=399000,
        is_free=True,
        level="Intermediate",
        duration_hours=4.5,
        total_lessons=18,
        rating=4.9,
        reviews_count=1280,
        students_enrolled=4200,
        description="Khóa học thực chiến giúp bạn làm chủ các kỹ thuật xử lý dữ liệu phức tạp, làm sạch bảng biểu và chuẩn bị dữ liệu phân tích với Pandas.",
        what_you_will_learn=[
            "Kỹ thuật đọc, làm sạch và lọc dữ liệu thiếu (NaN handling)",
            "Chuyển đổi kiểu dữ liệu và xử lý chuỗi văn bản nâng cao",
            "Gom nhóm và tổng hợp dữ liệu với Groupby & Pivot Table",
            "Trực quan hóa dữ liệu thống kê phục vụ thiết kế sản phẩm"
        ],
        requirements=[
            "Hiểu biết cơ bản về cú pháp Python",
            "Máy tính cài đặt Jupyter Notebook hoặc VS Code"
        ],
        is_featured=True,
        is_trending=True
    )
    db.add(c1)

    c2 = Course(
        title="Product Design Thinking & Systems",
        slug="product-design-thinking-systems",
        category_id=categories[1].id,
        instructor_id=instructors[0].id,
        thumbnail_url="https://images.unsplash.com/photo-1581291518655-9523c9320cf6?w=600",
        price=299000,
        original_price=599000,
        is_free=False,
        level="All Levels",
        duration_hours=6.0,
        total_lessons=24,
        rating=4.9,
        reviews_count=850,
        students_enrolled=2100,
        description="Khám phá phương pháp tư duy thiết kế lấy người dùng làm trung tâm và xây dựng bộ Design System chuyên nghiệp quy chuẩn Figma.",
        what_you_will_learn=[
            "5 bước của quy trình Design Thinking trong dự án phần mềm",
            "Quy chuẩn Figma Tokens, Variables và Auto-Layout responsive",
            "Thiết kế lưới (Grid 8pt), Typography và bảng màu thương hiệu",
            "Tạo Prototype tương tác cao phục vụ kiểm thử Usability"
        ],
        requirements=["Đã cài đặt phần mềm Figma"],
        is_featured=True,
        is_trending=False
    )
    db.add(c2)
    db.flush()

    # Thêm Sections & Lessons cho Course 1
    s1 = CourseSection(course_id=c1.id, title="Chương 1: Khởi động & Nền tảng cấu trúc DataFrame", order_index=1)
    s2 = CourseSection(course_id=c1.id, title="Chương 2: Làm sạch dữ liệu và Xử lý giá trị trống", order_index=2)
    s3 = CourseSection(course_id=c1.id, title="Chương 3: Tổng hợp, Groupby và Bài tập dự án", order_index=3)
    db.add_all([s1, s2, s3])
    db.flush()

    lessons_c1 = [
        Lesson(section_id=s1.id, title="01. Tổng quan về Data Wrangling và Môi trường học", lesson_type="video", duration_minutes=12, is_preview=True, order_index=1),
        Lesson(section_id=s1.id, title="02. Tạo và thao tác trên Pandas Series & DataFrame", lesson_type="video", duration_minutes=18, is_preview=True, order_index=2),
        Lesson(section_id=s1.id, title="03. Tài liệu tóm tắt phím tắt và hàm cốt lõi", lesson_type="reading", duration_minutes=10, is_preview=False, order_index=3),
        Lesson(section_id=s2.id, title="04. Phát hiện và xử lý dữ liệu bị khuyết NaN", lesson_type="video", duration_minutes=22, is_preview=False, order_index=4),
        Lesson(section_id=s2.id, title="05. Podcast: Kinh nghiệm xử lý dữ liệu thực tế", lesson_type="audio", duration_minutes=15, is_preview=False, order_index=5),
        Lesson(section_id=s2.id, title="06. Slide bài giảng: Chiến lược tiền xử lý dữ liệu", lesson_type="slide", duration_minutes=15, is_preview=False, order_index=6),
        Lesson(section_id=s3.id, title="07. Gom nhóm nâng cao với GroupBy và Aggregate", lesson_type="video", duration_minutes=25, is_preview=False, order_index=7),
        Lesson(section_id=s3.id, title="08. Dự án hoàn thiện: Phân tích hành vi người dùng App", lesson_type="video", duration_minutes=30, is_preview=False, order_index=8)
    ]
    db.add_all(lessons_c1)

    # 7. GAMIFICATION: DAILY QUESTS (Trùng khớp 100% Figma S10 & S17)
    quests_hung = [
        DailyQuest(
            user_id=hung_user.id,
            title="Study for 20 mins",
            quest_type="study_time",
            target_value=20,
            current_value=20,
            reward_xp=50,
            is_completed=True,
            is_claimed=False,
            icon="schedule"
        ),
        DailyQuest(
            user_id=hung_user.id,
            title="Complete 1 Quiz",
            quest_type="quiz",
            target_value=1,
            current_value=0,
            reward_xp=40,
            is_completed=False,
            is_claimed=False,
            icon="quiz"
        ),
        DailyQuest(
            user_id=hung_user.id,
            title="Take 1 Lesson Note",
            quest_type="notes",
            target_value=1,
            current_value=1,
            reward_xp=20,
            is_completed=True,
            is_claimed=True,
            icon="edit_note"
        )
    ]
    db.add_all(quests_hung)

    # 8. STUDY PLAN (S11)
    study_plan = [
        StudyPlanItem(user_id=hung_user.id, course_title="Applied Data Wrangling", lesson_title="04. Phát hiện và xử lý dữ liệu bị khuyết NaN", duration_minutes=22, is_completed=True, order_index=1),
        StudyPlanItem(user_id=hung_user.id, course_title="Applied Data Wrangling", lesson_title="05. Podcast: Kinh nghiệm xử lý dữ liệu thực tế", duration_minutes=15, is_completed=False, order_index=2),
        StudyPlanItem(user_id=hung_user.id, course_title="Product Design Thinking", lesson_title="01. Bản chất của Design Thinking trong thực tế", duration_minutes=18, is_completed=False, order_index=3)
    ]
    db.add_all(study_plan)

    # 9. STREAK LOGS (S12)
    today = date.today()
    for i in range(12):
        d = today - timedelta(days=i)
        db.add(StudyStreakLog(user_id=hung_user.id, log_date=d, minutes_studied=35, is_active_day=True))

    # 10. WEEKLY GOAL (S13)
    db.add(WeeklyGoalLog(
        user_id=hung_user.id,
        week_number=45,
        target_hours=7.0,
        completed_hours=5.5,
        daily_breakdown={"Thứ 2": 1.2, "Thứ 3": 0.8, "Thứ 4": 1.5, "Thứ 5": 1.0, "Thứ 6": 1.0, "Thứ 7": 0.0, "CN": 0.0}
    ))

    # 11. BADGES (S15)
    badges = [
        Badge(code="streak_10", name="Chiến Binh Bền Bỉ", description="Đạt chuỗi học tập 10 ngày liên tục", category="Streak", icon="local_fire_department", rarity="Gold", xp_bonus=100),
        Badge(code="first_course", name="Khởi Đầu Hoàn Hảo", description="Hoàn thành khóa học đầu tiên trên EduPath", category="Course", icon="verified", rarity="Silver", xp_bonus=80),
        Badge(code="quiz_master", name="Bậc Thầy Trắc Nghiệm", description="Đạt điểm tuyệt đối trong 3 bài kiểm tra", category="Exam", icon="stars", rarity="Gold", xp_bonus=120),
        Badge(code="fast_learner", name="Tốc Độ Bứt Phá", description="Hoàn thành 5 bài học trong vòng 24 giờ", category="Speed", icon="bolt", rarity="Diamond", xp_bonus=150)
    ]
    db.add_all(badges)
    db.flush()

    db.add(UserBadge(user_id=hung_user.id, badge_id=badges[0].id, is_unlocked=True, unlocked_at=datetime.now(timezone.utc)))
    db.add(UserBadge(user_id=hung_user.id, badge_id=badges[1].id, is_unlocked=True, unlocked_at=datetime.now(timezone.utc)))

    # 12. SKILL TREE NODES (S20)
    skill_nodes = [
        SkillNode(title="Tư duy UX & Nghiên cứu", category="Design", level=3, max_level=5, current_points=3, max_points=5, status="in_progress", icon="psychology"),
        SkillNode(title="Figma Component & Tokens", category="Design", level=4, max_level=5, current_points=4, max_points=5, status="in_progress", icon="grid_view"),
        SkillNode(title="Xử lý Dữ liệu Pandas", category="Data", level=3, max_level=5, current_points=3, max_points=5, status="in_progress", icon="table_chart"),
        SkillNode(title="API Backend Integration", category="Backend", level=2, max_level=5, current_points=2, max_points=5, status="in_progress", icon="api")
    ]
    db.add_all(skill_nodes)

    # 13. GLOSSARY TERMS (S41)
    glossary = [
        GlossaryTerm(term="Affordance", category="UX/UI", definition="Đặc tính trực quan của một đối tượng gợi ý cho người dùng biết cách tương tác với nó (ví dụ nút bấm nổi lên gợi ý hành vi ấn).", vietnamese_translation="Khả năng gợi ý tương tác", example_usage="Nút CTA có hiệu ứng đổ bóng tạo affordance rõ nét."),
        GlossaryTerm(term="DataFrame", category="Data", definition="Cấu trúc dữ liệu 2 chiều có gắn nhãn hàng và cột trong thư viện Pandas, tương tự bảng tính Excel hoặc SQL table.", vietnamese_translation="Bảng dữ liệu hai chiều", example_usage="df = pd.read_csv('data.csv')"),
        GlossaryTerm(term="Design Token", category="UX/UI", definition="Các biến số nguyên tử lưu trữ giá trị thiết kế như mã màu, kích thước font, bán kính bo góc dùng chung giữa Design và Code.", vietnamese_translation="Mã định danh thiết kế", example_usage="color.primary = #4F46E5"),
        GlossaryTerm(term="Heuristic Evaluation", category="UX/UI", definition="Phương pháp đánh giá tính khả dụng của giao diện dựa trên 10 nguyên lý kinh điển của Jakob Nielsen.", vietnamese_translation="Đánh giá khả dụng theo kinh nghiệm", example_usage="Tiến hành heuristic review để phát hiện lỗi điều hướng.")
    ]
    db.add_all(glossary)

    # 14. COHORT SCHEDULE & ENROLLMENTS (S45, S46)
    cohort1 = CohortSchedule(
        course_id=c1.id,
        cohort_name="Lớp K23 - Tối Thứ 3 & Thứ 5 (19:30)",
        instructor_name="Ms. Lan",
        start_date=date.today(),
        meeting_time="19:30 - 21:00",
        meeting_platform="Google Meet",
        max_learners=25,
        enrolled_learners=18,
        meeting_link="https://meet.google.com/edu-path-k23"
    )
    db.add(cohort1)
    db.flush()

    enr1 = CourseEnrollment(
        user_id=hung_user.id,
        course_id=c1.id,
        cohort_id=cohort1.id,
        progress_percent=75.0,
        status="in_progress"
    )
    enr2 = CourseEnrollment(
        user_id=hung_user.id,
        course_id=c2.id,
        progress_percent=100.0,
        status="completed",
        completed_at=datetime.now(timezone.utc)
    )
    db.add_all([enr1, enr2])

    # 15. FINAL QUIZ & CERTIFICATES (S47)
    final_quiz = FinalQuiz(
        course_id=c1.id,
        title="Bài thi Tốt nghiệp: Pandas & Xử lý Dữ liệu Thực chiến",
        total_questions=2,
        time_limit_minutes=20,
        passing_score=80
    )
    db.add(final_quiz)
    db.flush()

    q1 = FinalQuizQuestion(
        quiz_id=final_quiz.id,
        question_text="Trong Pandas, phương thức nào được sử dụng để loại bỏ các hàng có chứa giá trị thiếu (NaN)?",
        options=["df.dropna()", "df.fillna()", "df.remove_nan()", "df.delete_empty()"],
        correct_option_index=0,
        explanation="df.dropna() xóa bỏ các hàng hoặc cột có chứa giá trị thiếu theo trục chỉ định."
    )
    q2 = FinalQuizQuestion(
        quiz_id=final_quiz.id,
        question_text="Để tính giá trị trung bình của từng nhóm dữ liệu theo cột 'Category', câu lệnh nào là chuẩn xác nhất?",
        options=["df.groupby('Category').mean()", "df.group('Category').average()", "df.split('Category').sum()", "df.sort('Category').mean()"],
        correct_option_index=0,
        explanation="df.groupby('Category').mean() thực hiện gom nhóm và tính toán giá trị trung bình trên từng nhóm."
    )
    db.add_all([q1, q2])

    cert1 = Certificate(
        user_id=hung_user.id,
        course_id=c2.id,
        certificate_code="EDUPATH-2026-X89B",
        student_name="Nguyễn Văn Hùng",
        course_title="Product Design Thinking & Systems",
        instructor_name="Ms. Lan",
        issued_date=date.today(),
        final_grade="Xuất Sắc (Grade A+)",
        verification_url="https://edupath.vn/verify/EDUPATH-2026-X89B"
    )
    db.add(cert1)

    # 16. TIMESTAMPED NOTE (S40)
    note1 = TimestampedNote(
        user_id=hung_user.id,
        lesson_id=lessons_c1[0].id,
        timestamp_seconds=135,
        note_text="Cần nhớ quy tắc đặt tên biến snake_case trong Python khi làm sạch dữ liệu."
    )
    db.add(note1)

    # 17. OFFLINE DOWNLOAD (S42)
    dl1 = OfflineDownload(
        user_id=hung_user.id,
        lesson_id=lessons_c1[0].id,
        course_id=c1.id,
        file_size_mb=48.5,
        download_status="completed"
    )
    db.add(dl1)

    db.commit()
    print("[+] Đã nạp thành công toàn bộ dữ liệu mẫu chuẩn cho 50 màn hình!")

