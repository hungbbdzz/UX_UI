# -*- coding: utf-8 -*-
"""
EduPath Backend - Router: Trình phát Bài học, Ghi chú mốc thời gian, Tra cứu & Chế độ Tập trung (S36-S44)
"""

from typing import List, Optional
from fastapi import APIRouter, Depends, HTTPException, Query, status
from sqlalchemy.orm import Session

from app.core.database import get_db
from app.api.deps import get_current_user
from app.models.user import User
from app.models.course import Lesson, CourseSection, Course
from app.models.learning import (
    UserLessonProgress,
    TimestampedNote,
    GlossaryTerm,
    OfflineDownload,
    FocusSession
)
from app.schemas.learning import (
    LessonDetailDTO,
    UpdateProgressRequest,
    TimestampedNoteDTO,
    CreateNoteRequest,
    GlossaryTermDTO,
    OfflineDownloadDTO,
    FocusSessionRequest,
    FocusSessionResponse
)

router = APIRouter(prefix="/learning", tags=["04 · Học đa phương tiện, Ghi chú & Trợ giúp (S36–S44)"])

@router.get("/lessons/{lesson_id}", response_model=LessonDetailDTO, summary="Chi tiết bài học & Trình phát Đa phương tiện (S36–S39, S43)")
def get_lesson_content(
    lesson_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """
    Tải nội dung bài học theo loại hình:
    - S36: Video player
    - S37: Audio lesson podcast
    - S38: Reading markdown article
    - S39: Slide viewer PDF
    - S43: Kèm vị trí phát trước đó của người dùng
    """
    lesson = db.query(Lesson).filter(Lesson.id == lesson_id).first()
    if not lesson:
        raise HTTPException(status_code=404, detail="Không tìm thấy bài học.")

    section = lesson.section
    course = section.course if section else None

    # Lấy tiến độ đã học
    progress = db.query(UserLessonProgress).filter(
        UserLessonProgress.user_id == current_user.id,
        UserLessonProgress.lesson_id == lesson_id
    ).first()

    return LessonDetailDTO(
        id=lesson.id,
        section_id=lesson.section_id,
        course_id=course.id if course else 1,
        course_title=course.title if course else "Khóa học",
        title=lesson.title,
        lesson_type=lesson.lesson_type,
        duration_minutes=lesson.duration_minutes,
        video_url=lesson.video_url,
        audio_url=lesson.audio_url,
        reading_content=lesson.reading_content,
        slide_url=lesson.slide_url,
        is_preview=lesson.is_preview,
        playback_position_seconds=progress.playback_position_seconds if progress else 0,
        is_completed=progress.is_completed if progress else False
    )

@router.post("/lessons/{lesson_id}/progress", summary="Cập nhật tiến độ học & hoàn thành bài (S36–S39)")
def update_lesson_progress(
    lesson_id: int,
    payload: UpdateProgressRequest,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Lưu giây video/audio đang xem và tích xanh khi học xong bài học"""
    lesson = db.query(Lesson).filter(Lesson.id == lesson_id).first()
    if not lesson:
        raise HTTPException(status_code=404, detail="Không tìm thấy bài học.")

    course_id = lesson.section.course_id if lesson.section else 1
    progress = db.query(UserLessonProgress).filter(
        UserLessonProgress.user_id == current_user.id,
        UserLessonProgress.lesson_id == lesson_id
    ).first()

    if not progress:
        progress = UserLessonProgress(
            user_id=current_user.id,
            lesson_id=lesson_id,
            course_id=course_id,
            total_duration_seconds=lesson.duration_minutes * 60
        )
        db.add(progress)

    progress.playback_position_seconds = payload.playback_position_seconds
    if payload.is_completed:
        progress.is_completed = True
        # Tặng 20 XP khi hoàn thành 1 bài học
        if current_user.profile:
            current_user.profile.xp += 20

    db.commit()
    return {"message": "Đã lưu tiến độ học tập!", "is_completed": progress.is_completed}

@router.get("/lessons/{lesson_id}/notes", response_model=List[TimestampedNoteDTO], summary="Danh sách ghi chú theo mốc thời gian (S40)")
def get_timestamped_notes(
    lesson_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Lấy danh sách các ghi chú của người dùng tại các mốc giây trong video (S40)"""
    notes = db.query(TimestampedNote).filter(
        TimestampedNote.user_id == current_user.id,
        TimestampedNote.lesson_id == lesson_id
    ).order_by(TimestampedNote.timestamp_seconds.asc()).all()

    def fmt_time(secs: int) -> str:
        m = secs // 60
        s = secs % 60
        return f"{m:02d}:{s:02d}"

    return [
        TimestampedNoteDTO(
            id=n.id,
            lesson_id=n.lesson_id,
            timestamp_seconds=n.timestamp_seconds,
            timestamp_formatted=fmt_time(n.timestamp_seconds),
            note_text=n.note_text,
            created_at=n.created_at
        )
        for n in notes
    ]

@router.post("/lessons/{lesson_id}/notes", status_code=status.HTTP_201_CREATED, summary="Tạo ghi chú mới gắn mốc thời gian (S40)")
def create_timestamped_note(
    lesson_id: int,
    payload: CreateNoteRequest,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Thêm ghi chú tại giây video hiện tại (Ví dụ: tại phút 02:15 ghi chú 'Cần xem lại cú pháp groupby')"""
    note = TimestampedNote(
        user_id=current_user.id,
        lesson_id=lesson_id,
        timestamp_seconds=payload.timestamp_seconds,
        note_text=payload.note_text
    )
    db.add(note)
    db.commit()
    return {"message": "Đã tạo ghi chú thành công!", "note_id": note.id}

@router.get("/glossary", response_model=List[GlossaryTermDTO], summary="Từ điển tra cứu thuật ngữ chuyên ngành (S41)")
def search_glossary(
    q: Optional[str] = Query(None, description="Từ khóa tra cứu"),
    category: Optional[str] = Query(None, description="Lĩnh vực: UX/UI, Data, Dev"),
    db: Session = Depends(get_db)
):
    """Tra cứu định nghĩa, thuật ngữ tiếng Anh và bản dịch tiếng Việt (S41)"""
    query = db.query(GlossaryTerm)
    if q:
        query = query.filter(GlossaryTerm.term.ilike(f"%{q}%"))
    if category:
        query = query.filter(GlossaryTerm.category == category)
    
    terms = query.all()
    return terms

@router.get("/offline-downloads", response_model=List[OfflineDownloadDTO], summary="Quản lý bài học tải xuống ngoại tuyến (S42)")
def get_offline_downloads(
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Lấy danh sách các video bài học đã tải về thiết bị và dung lượng đã dùng (S42)"""
    downloads = db.query(OfflineDownload).filter(OfflineDownload.user_id == current_user.id).all()
    
    result = []
    for d in downloads:
        lesson = db.query(Lesson).filter(Lesson.id == d.lesson_id).first()
        course = db.query(Course).filter(Course.id == d.course_id).first()
        result.append(OfflineDownloadDTO(
            id=d.id,
            lesson_id=d.lesson_id,
            course_id=d.course_id,
            lesson_title=lesson.title if lesson else "Bài học",
            course_title=course.title if course else "Khóa học",
            file_size_mb=d.file_size_mb,
            download_status=d.download_status,
            downloaded_at=d.downloaded_at
        ))
    return result

@router.post("/offline-downloads/{lesson_id}", status_code=status.HTTP_201_CREATED, summary="Tải bài học về thiết bị ngoại tuyến (S42)")
def download_lesson_offline(
    lesson_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Lưu bài học vào danh sách tải ngoại tuyến"""
    lesson = db.query(Lesson).filter(Lesson.id == lesson_id).first()
    if not lesson:
        raise HTTPException(status_code=404, detail="Không tìm thấy bài học.")

    course_id = lesson.section.course_id if lesson.section else 1
    existing = db.query(OfflineDownload).filter(
        OfflineDownload.user_id == current_user.id,
        OfflineDownload.lesson_id == lesson_id
    ).first()

    if existing:
        return {"message": "Bài học này đã được tải xuống trước đó.", "download_id": existing.id}

    dl = OfflineDownload(
        user_id=current_user.id,
        lesson_id=lesson_id,
        course_id=course_id,
        file_size_mb=round(lesson.duration_minutes * 4.2, 1),
        download_status="completed"
    )
    db.add(dl)
    db.commit()
    return {"message": "Tải bài học ngoại tuyến thành công!", "download_id": dl.id}

@router.post("/focus-session", response_model=FocusSessionResponse, summary="Hoàn thành phiên học tập trung Pomodoro (S44)")
def complete_focus_session(
    payload: FocusSessionRequest,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Ghi nhận phiên tập trung Focus Mode và cộng XP khích lệ học viên (S44)"""
    session = FocusSession(
        user_id=current_user.id,
        session_minutes=payload.session_minutes,
        completed=True
    )
    db.add(session)

    # Thưởng 10 XP cho mỗi 10 phút tập trung
    earned_xp = (payload.session_minutes // 10) * 10
    if current_user.profile:
        current_user.profile.xp += earned_xp

    db.commit()
    return FocusSessionResponse(
        session_id=session.id,
        session_minutes=payload.session_minutes,
        xp_earned=earned_xp,
        message=f"Tuyệt vời! Bạn đã duy trì sự tập trung suốt {payload.session_minutes} phút và nhận được +{earned_xp} XP."
    )
