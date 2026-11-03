# -*- coding: utf-8 -*-
"""
EduPath Backend - Router: Onboarding, Khảo sát & Đánh giá năng lực đầu vào (S03-S09)
"""

from typing import List
from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session

from app.core.database import get_db
from app.api.deps import get_current_user
from app.models.user import User
from app.models.onboarding import (
    LearningGoal,
    Interest,
    PlacementQuestion,
    SuggestedPath,
    UserOnboardingState
)
from app.schemas.onboarding import (
    LearningGoalDTO,
    InterestDTO,
    PlacementQuestionDTO,
    PlacementSubmitRequest,
    PlacementResultDTO,
    SuggestedPathDTO,
    SaveOnboardingPreferencesRequest
)

router = APIRouter(prefix="/onboarding", tags=["01 · Khảo sát & Đánh giá năng lực (S03–S09)"])

@router.get("/goals", response_model=List[LearningGoalDTO], summary="Danh sách mục tiêu học tập (S03)")
def get_learning_goals(db: Session = Depends(get_db)):
    """Lấy danh sách các mục tiêu học tập chính: Chuyển ngành, Thăng tiến, Du học, Sở thích"""
    goals = db.query(LearningGoal).order_by(LearningGoal.popularity_rank.asc()).all()
    return goals

@router.get("/interests", response_model=List[InterestDTO], summary="Danh sách lĩnh vực quan tâm (S04)")
def get_interests(db: Session = Depends(get_db)):
    """Lấy danh sách lĩnh vực: Python, UX/UI, Web Dev, Mobile App, AI, English..."""
    interests = db.query(Interest).all()
    return interests

@router.get("/levels", summary="Danh sách trình độ đầu vào (S05)")
def get_levels():
    """Lấy danh mục 3 cấp độ học viên: Người mới bắt đầu, Đã có nền tảng, Nâng cao"""
    return [
        {"code": "Beginner", "title": "Người mới bắt đầu", "desc": "Chưa có kinh nghiệm, muốn học từ nền tảng căn bản."},
        {"code": "Intermediate", "title": "Đã có nền tảng", "desc": "Đã nắm vững kiến thức cơ bản, muốn nâng cao kỹ năng thực chiến."},
        {"code": "Advanced", "title": "Chuyên sâu / Chuyên gia", "desc": "Muốn giải quyết các bài toán phức tạp, kiến trúc hệ thống."}
    ]

@router.get("/study-times", summary="Các mốc thời gian học hằng ngày (S06)")
def get_study_times():
    """Lấy các mức cam kết thời gian học: 15 phút, 30 phút, 45 phút, 60 phút"""
    return [
        {"minutes": 15, "label": "15 phút / ngày", "level": "Thong thả", "desc": "Phù hợp người bận rộn"},
        {"minutes": 30, "label": "30 phút / ngày", "level": "Tiêu chuẩn", "desc": "Khuyên dùng để duy trì tiến độ ổn định"},
        {"minutes": 45, "label": "45 phút / ngày", "level": "Tích cực", "desc": "Tiến bộ nhanh chóng"},
        {"minutes": 60, "label": "60 phút / ngày", "level": "Bứt phá", "desc": "Chinh phục lộ trình trong thời gian ngắn nhất"}
    ]

@router.get("/placement-questions", response_model=List[PlacementQuestionDTO], summary="Đề thi đánh giá năng lực đầu vào (S07)")
def get_placement_questions(db: Session = Depends(get_db)):
    """Lấy bộ câu hỏi trắc nghiệm đánh giá năng lực đầu vào (Placement Test)"""
    questions = db.query(PlacementQuestion).all()
    return questions

@router.post("/placement-test/submit", response_model=PlacementResultDTO, summary="Nộp bài thi đánh giá & nhận kết quả (S08)")
def submit_placement_test(
    payload: PlacementSubmitRequest,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Chấm điểm bài test đầu vào và xếp loại trình độ tương ứng"""
    all_questions = {q.id: q for q in db.query(PlacementQuestion).all()}
    total = len(payload.answers)
    correct = 0

    for ans in payload.answers:
        q = all_questions.get(ans.question_id)
        if q and q.correct_option_index == ans.selected_option_index:
            correct += 1

    score_pct = int((correct / total) * 100) if total > 0 else 0

    if score_pct >= 80:
        assigned_level = "B2 - Nâng cao (Advanced)"
        recommendation = "Bạn đã có nền tảng rất vững! Đề xuất lộ trình Chuyên gia thiết kế hệ thống và Kiến trúc phần mềm."
    elif score_pct >= 50:
        assigned_level = "B1 - Trung cấp (Intermediate)"
        recommendation = "Nền tảng tốt! Khóa học thực chiến về Pandas, UI/UX Design System sẽ giúp bạn bứt phá."
    else:
        assigned_level = "A2 - Cơ bản (Beginner)"
        recommendation = "Bắt đầu với các nguyên lý thiết kế cơ bản và cú pháp Python nền tảng để tự tin hơn."

    # Cập nhật kết quả vào trạng thái Onboarding của người dùng
    state = db.query(UserOnboardingState).filter(UserOnboardingState.user_id == current_user.id).first()
    if not state:
        state = UserOnboardingState(user_id=current_user.id)
        db.add(state)
    state.placement_score = score_pct
    state.placement_rank = assigned_level
    db.commit()

    return PlacementResultDTO(
        total_questions=total,
        correct_count=correct,
        score_percent=score_pct,
        assigned_level=assigned_level,
        strengths=["Tư duy thiết kế logic", "Khả năng phân tích yêu cầu"],
        recommendation=recommendation
    )

@router.get("/suggested-paths", response_model=List[SuggestedPathDTO], summary="Lộ trình học AI gợi ý (S09)")
def get_suggested_paths(db: Session = Depends(get_db)):
    """Lấy danh sách các lộ trình học tập được hệ thống AI cá nhân hóa đề xuất"""
    paths = db.query(SuggestedPath).all()
    return paths

@router.post("/preferences", summary="Lưu toàn bộ tùy chọn khảo sát Onboarding (S03-S06)")
def save_onboarding_preferences(
    payload: SaveOnboardingPreferencesRequest,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Lưu mục tiêu, sở thích, trình độ và thời gian học hàng ngày vào profile người dùng"""
    state = db.query(UserOnboardingState).filter(UserOnboardingState.user_id == current_user.id).first()
    if not state:
        state = UserOnboardingState(user_id=current_user.id)
        db.add(state)

    state.selected_goal_code = payload.goal_code
    state.selected_interests = payload.interest_codes
    state.selected_level = payload.current_level
    state.daily_study_minutes = payload.daily_study_minutes

    if current_user.profile:
        current_user.profile.current_level = payload.current_level
        current_user.profile.daily_study_minutes = payload.daily_study_minutes

    db.commit()
    return {"message": "Đã lưu cài đặt lộ trình thành công!", "user_id": current_user.id}
