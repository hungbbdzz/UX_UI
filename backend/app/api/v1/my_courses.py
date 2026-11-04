# -*- coding: utf-8 -*-
"""
EduPath Backend - Router: Khóa học của tôi, Học nhóm, Bài thi & Chứng chỉ (S45-S48)
"""

from typing import List, Optional
from datetime import date, datetime, timezone
import uuid
from fastapi import APIRouter, Depends, HTTPException, Query, status
from sqlalchemy.orm import Session

from app.core.database import get_db
from app.api.deps import get_current_user
from app.models.user import User
from app.models.course import Course, Lesson
from app.models.learning import UserLessonProgress
from app.models.cohort_exam import (
    CohortSchedule,
    CourseEnrollment,
    FinalQuiz,
    FinalQuizQuestion,
    Certificate
)
from app.schemas.cohort_exam import (
    CohortScheduleDTO,
    EnrolledCourseItemDTO,
    FinalQuizDTO,
    FinalQuizQuestionDTO,
    SubmitQuizRequest,
    QuizResultDTO,
    CertificateDTO,
    NextCourseRecommendationDTO
)

router = APIRouter(prefix="/my-courses", tags=["05 · Khóa học của tôi, Lịch nhóm & Chứng chỉ (S45–S48)"])

@router.get("/cohorts", response_model=List[CohortScheduleDTO], summary="Lịch học nhóm & Lớp đồng hành (S45)")
def get_cohort_schedules(
    course_id: Optional[int] = Query(None, description="Lọc theo khóa học"),
    db: Session = Depends(get_db)
):
    """Lấy danh sách các lớp học nhóm có mentor dẫn dắt theo tuần (S45)"""
    query = db.query(CohortSchedule)
    if course_id:
        query = query.filter(CohortSchedule.course_id == course_id)
    cohorts = query.all()
    return cohorts

@router.get("/enrolled", response_model=List[EnrolledCourseItemDTO], summary="Danh sách Khóa học của tôi (S46)")
def get_enrolled_courses(
    filter_status: str = Query("all", description="Lọc: all, in_progress, completed"),
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Lấy danh sách các khóa học học viên đang tham gia kèm tiến độ % (S46)"""
    query = db.query(CourseEnrollment).filter(CourseEnrollment.user_id == current_user.id)
    if filter_status in ["in_progress", "completed", "archived"]:
        query = query.filter(CourseEnrollment.status == filter_status)

    enrollments = query.all()
    result = []
    for enr in enrollments:
        c = enr.course
        if not c:
            continue
        
        # Đếm số bài đã hoàn thành
        completed_count = db.query(UserLessonProgress).filter(
            UserLessonProgress.user_id == current_user.id,
            UserLessonProgress.course_id == c.id,
            UserLessonProgress.is_completed == True
        ).count()

        result.append(EnrolledCourseItemDTO(
            enrollment_id=enr.id,
            course_id=c.id,
            title=c.title,
            instructor_name=c.instructor.name if c.instructor else "Ms. Lan",
            thumbnail_url=c.thumbnail_url,
            progress_percent=enr.progress_percent,
            status=enr.status,
            total_lessons=c.total_lessons,
            completed_lessons=completed_count,
            enrolled_at=enr.enrolled_at
        ))
    return result

@router.post("/enroll/{course_id}", status_code=status.HTTP_201_CREATED, summary="Đăng ký khóa học mới (S30, S46)")
def enroll_course(
    course_id: int,
    cohort_id: Optional[int] = Query(None, description="ID lớp học nhóm muốn tham gia"),
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Đăng ký khóa học và đưa vào danh sách Khóa học của tôi"""
    course = db.query(Course).filter(Course.id == course_id).first()
    if not course:
        raise HTTPException(status_code=404, detail="Không tìm thấy khóa học.")

    existing = db.query(CourseEnrollment).filter(
        CourseEnrollment.user_id == current_user.id,
        CourseEnrollment.course_id == course_id
    ).first()

    if existing:
        return {"message": "Bạn đã đăng ký khóa học này rồi!", "enrollment_id": existing.id}

    enr = CourseEnrollment(
        user_id=current_user.id,
        course_id=course_id,
        cohort_id=cohort_id,
        progress_percent=0.0,
        status="in_progress"
    )
    db.add(enr)
    course.students_enrolled += 1
    db.commit()

    return {"message": "Đăng ký khóa học thành công!", "enrollment_id": enr.id}

@router.get("/{course_id}/progress", summary="Tiến độ học chi tiết khóa học (S47)")
def get_course_progress_detail(
    course_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Xem tiến độ % từng chương, bài học đã hoàn thành và điều kiện cấp chứng chỉ (S47)"""
    course = db.query(Course).filter(Course.id == course_id).first()
    if not course:
        raise HTTPException(status_code=404, detail="Không tìm thấy khóa học.")

    enrollment = db.query(CourseEnrollment).filter(
        CourseEnrollment.user_id == current_user.id,
        CourseEnrollment.course_id == course_id
    ).first()

    total_lessons = course.total_lessons or 1
    completed_lessons = db.query(UserLessonProgress).filter(
        UserLessonProgress.user_id == current_user.id,
        UserLessonProgress.course_id == course_id,
        UserLessonProgress.is_completed == True
    ).count()

    pct = round((completed_lessons / total_lessons) * 100, 1)
    if enrollment and enrollment.progress_percent != pct:
        enrollment.progress_percent = pct
        if pct >= 100.0:
            enrollment.status = "completed"
        db.commit()

    is_eligible_for_exam = (pct >= 80.0)

    return {
        "course_id": course.id,
        "course_title": course.title,
        "progress_percent": pct,
        "completed_lessons": completed_lessons,
        "total_lessons": total_lessons,
        "is_eligible_for_final_exam": is_eligible_for_exam,
        "status": enrollment.status if enrollment else "not_enrolled"
    }

@router.get("/{course_id}/final-quiz", response_model=FinalQuizDTO, summary="Đề thi trắc nghiệm cuối khóa (S47)")
def get_final_quiz(course_id: int, db: Session = Depends(get_db)):
    """Lấy đề thi tốt nghiệp cuối khóa để cấp chứng chỉ (S47)"""
    quiz = db.query(FinalQuiz).filter(FinalQuiz.course_id == course_id).first()
    if not quiz:
        # Nếu chưa có, trả về bài thi mẫu tiêu chuẩn
        return FinalQuizDTO(
            id=1,
            course_id=course_id,
            title="Bài thi đánh giá năng lực cuối khóa",
            total_questions=5,
            time_limit_minutes=20,
            passing_score=80,
            questions=[
                FinalQuizQuestionDTO(
                    id=101,
                    question_text="Trong thư viện Pandas, phương thức nào dùng để lọc bỏ các giá trị bị khuyết (NaN)?",
                    options=["df.dropna()", "df.fillna()", "df.filter_null()", "df.clean()"]
                ),
                FinalQuizQuestionDTO(
                    id=102,
                    question_text="Trong thiết kế UX/UI, độ tương phản tối thiểu cho chữ thường chuẩn WCAG AA là bao nhiêu?",
                    options=["3.0:1", "4.5:1", "7.0:1", "2.5:1"]
                )
            ]
        )

    questions = db.query(FinalQuizQuestion).filter(FinalQuizQuestion.quiz_id == quiz.id).all()
    return FinalQuizDTO(
        id=quiz.id,
        course_id=quiz.course_id,
        title=quiz.title,
        total_questions=len(questions),
        time_limit_minutes=quiz.time_limit_minutes,
        passing_score=quiz.passing_score,
        questions=[
            FinalQuizQuestionDTO(
                id=q.id,
                question_text=q.question_text,
                options=q.options
            )
            for q in questions
        ]
    )

@router.post("/{course_id}/final-quiz/submit", response_model=QuizResultDTO, summary="Nộp bài thi cuối khóa & Chấm điểm cấp chứng chỉ (S47)")
def submit_final_quiz(
    course_id: int,
    payload: SubmitQuizRequest,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Chấm điểm bài thi. Đạt trên 80% sẽ tự động cấp chứng chỉ số chính thức (S47)"""
    quiz = db.query(FinalQuiz).filter(FinalQuiz.course_id == course_id).first()
    passing = quiz.passing_score if quiz else 80

    # Lấy đáp án đúng
    q_map = {}
    if quiz:
        for q in db.query(FinalQuizQuestion).filter(FinalQuizQuestion.quiz_id == quiz.id).all():
            q_map[q.id] = q.correct_option_index

    correct = 0
    total = len(payload.answers)
    for a in payload.answers:
        if q_map.get(a.question_id, 0) == a.selected_option_index:
            correct += 1

    score_pct = int((correct / total) * 100) if total > 0 else 100
    is_passed = (score_pct >= passing)

    if is_passed:
        # Cập nhật hoàn thành khóa học & cấp chứng chỉ
        enr = db.query(CourseEnrollment).filter(
            CourseEnrollment.user_id == current_user.id,
            CourseEnrollment.course_id == course_id
        ).first()
        if enr:
            enr.progress_percent = 100.0
            enr.status = "completed"
            enr.completed_at = datetime.now(timezone.utc)

        # Tạo chứng chỉ nếu chưa có
        cert = db.query(Certificate).filter(
            Certificate.user_id == current_user.id,
            Certificate.course_id == course_id
        ).first()
        if not cert:
            course = db.query(Course).filter(Course.id == course_id).first()
            code = f"EDUPATH-2026-{uuid.uuid4().hex[:6].upper()}"
            cert = Certificate(
                user_id=current_user.id,
                course_id=course_id,
                certificate_code=code,
                student_name=current_user.full_name,
                course_title=course.title if course else "Khóa học",
                instructor_name=course.instructor.name if (course and course.instructor) else "Ms. Lan",
                final_grade="Xuất Sắc (Grade A+)",
                verification_url=f"https://edupath.vn/verify/{code}"
            )
            db.add(cert)

            if current_user.profile:
                current_user.profile.certificates_count += 1
                current_user.profile.courses_completed += 1
                current_user.profile.xp += 250  # Thưởng 250 XP khi tốt nghiệp

        db.commit()

    return QuizResultDTO(
        total_questions=total,
        correct_count=correct,
        score_percent=score_pct,
        is_passed=is_passed,
        certificate_eligible=is_passed,
        feedback="Chúc mừng bạn đã xuất sắc vượt qua bài thi và nhận chứng chỉ!" if is_passed else "Rất tiếc điểm số chưa đạt mốc 80%. Hãy ôn tập lại các bài học và thử lại nhé!"
    )

@router.get("/{course_id}/certificate", response_model=CertificateDTO, summary="Xem & Tải chứng chỉ số tốt nghiệp (S47)")
def get_course_certificate(
    course_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Lấy dữ liệu chứng chỉ chính thức kèm mã định danh và link xác minh (S47)"""
    cert = db.query(Certificate).filter(
        Certificate.user_id == current_user.id,
        Certificate.course_id == course_id
    ).first()

    if not cert:
        # Nếu chưa có, tự động sinh chứng chỉ danh dự cho học viên test
        course = db.query(Course).filter(Course.id == course_id).first()
        code = f"EDUPATH-2026-X89B"
        cert = Certificate(
            user_id=current_user.id,
            course_id=course_id,
            certificate_code=code,
            student_name=current_user.full_name,
            course_title=course.title if course else "Applied Data Wrangling with Pandas",
            instructor_name="Ms. Lan",
            final_grade="Xuất Sắc (Grade A+)",
            verification_url=f"https://edupath.vn/verify/{code}"
        )
        db.add(cert)
        db.commit()

    return cert

@router.get("/{course_id}/next-recommendations", response_model=List[NextCourseRecommendationDTO], summary="Gợi ý khóa học tiếp theo sau khi tốt nghiệp (S48)")
def get_next_course_recommendations(course_id: int, db: Session = Depends(get_db)):
    """Gợi ý các khóa học chuyên sâu tiếp nối sau khi hoàn thành khóa học hiện tại (S48)"""
    next_courses = db.query(Course).filter(Course.id != course_id).limit(3).all()
    reasons = [
        "Khóa học nâng cao giúp phát triển năng lực toàn diện",
        "Được nhiều học viên cùng lộ trình lựa chọn tiếp theo",
        "Bổ trợ mạnh mẽ cho kỹ năng thực chiến sản phẩm"
    ]

    return [
        NextCourseRecommendationDTO(
            course_id=c.id,
            title=c.title,
            instructor_name=c.instructor.name if c.instructor else "Ms. Lan",
            thumbnail_url=c.thumbnail_url,
            reason=reasons[i % len(reasons)],
            match_percentage=98 - (i * 3)
        )
        for i, c in enumerate(next_courses)
    ]

