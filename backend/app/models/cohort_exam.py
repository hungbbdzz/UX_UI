# -*- coding: utf-8 -*-
"""
EduPath Backend - Mô hình dữ liệu Học nhóm, Khóa học của tôi, Thi cử & Chứng chỉ
Hỗ trợ màn hình: S45, S46, S47, S48
"""

from datetime import datetime, date, timezone
from sqlalchemy import Column, Integer, String, Text, Boolean, Date, DateTime, ForeignKey, Float, JSON
from sqlalchemy.orm import relationship

from app.core.database import Base

class CohortSchedule(Base):
    __tablename__ = "cohort_schedules"

    id = Column(Integer, primary_key=True, index=True)
    course_id = Column(Integer, ForeignKey("courses.id"), nullable=False)
    cohort_name = Column(String(100), default="Lớp K23 - Tối Thứ 3 & Thứ 5")
    instructor_name = Column(String(150), default="Ms. Lan")
    start_date = Column(Date, default=date.today)
    meeting_time = Column(String(50), default="19:30 - 21:00")
    meeting_platform = Column(String(50), default="Google Meet / Zoom")
    max_learners = Column(Integer, default=25)
    enrolled_learners = Column(Integer, default=18)
    meeting_link = Column(String(500), default="https://meet.google.com/abc-defg-hij")


class CourseEnrollment(Base):
    __tablename__ = "course_enrollments"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"), nullable=False)
    course_id = Column(Integer, ForeignKey("courses.id"), nullable=False)
    cohort_id = Column(Integer, ForeignKey("cohort_schedules.id"), nullable=True)
    
    enrolled_at = Column(DateTime, default=lambda: datetime.now(timezone.utc))
    progress_percent = Column(Float, default=0.0)  # 0% - 100%
    status = Column(String(50), default="in_progress")  # in_progress, completed, archived
    completed_at = Column(DateTime, nullable=True)

    user = relationship("User", back_populates="enrollments")
    course = relationship("Course", back_populates="enrollments")


class FinalQuiz(Base):
    __tablename__ = "final_quizzes"

    id = Column(Integer, primary_key=True, index=True)
    course_id = Column(Integer, ForeignKey("courses.id"), nullable=False)
    title = Column(String(255), default="Bài thi đánh giá cuối khóa (Final Examination)")
    total_questions = Column(Integer, default=15)
    time_limit_minutes = Column(Integer, default=30)
    passing_score = Column(Integer, default=80)  # 80% để pass


class FinalQuizQuestion(Base):
    __tablename__ = "final_quiz_questions"

    id = Column(Integer, primary_key=True, index=True)
    quiz_id = Column(Integer, ForeignKey("final_quizzes.id"), nullable=False)
    question_text = Column(Text, nullable=False)
    options = Column(JSON, nullable=False)  # 4 phương án
    correct_option_index = Column(Integer, nullable=False)
    explanation = Column(Text)


class Certificate(Base):
    __tablename__ = "certificates"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"), nullable=False)
    course_id = Column(Integer, ForeignKey("courses.id"), nullable=False)
    certificate_code = Column(String(100), unique=True, index=True, nullable=False)  # "EDUPATH-VKU-2026-X89B"
    student_name = Column(String(255), nullable=False)
    course_title = Column(String(255), nullable=False)
    instructor_name = Column(String(150), default="Ms. Lan")
    issued_date = Column(Date, default=date.today)
    final_grade = Column(String(20), default="Xuất Sắc (Grade A+)")
    verification_url = Column(String(500), default="https://edupath.vku.udn.vn/verify/EDUPATH-VKU-2026-X89B")

    user = relationship("User", back_populates="certificates")
