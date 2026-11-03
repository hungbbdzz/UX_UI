# -*- coding: utf-8 -*-
"""
EduPath Backend - Router: Tiến độ Học tập, Gamification & Hồ sơ Học viên (S10-S24)
"""

from typing import List, Dict, Any
from datetime import date
from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session

from app.core.database import get_db
from app.api.deps import get_current_user
from app.models.user import User, LearnerProfile, UserSettings
from app.models.gamification import (
    DailyQuest,
    StudyPlanItem,
    StudyStreakLog,
    WeeklyGoalLog,
    Badge,
    UserBadge,
    SkillNode
)
from app.models.course import Course, Category
from app.models.cohort_exam import CourseEnrollment
from app.schemas.learner import (
    DailyQuestDTO,
    StudyPlanItemDTO,
    StudyStreakDTO,
    WeeklyGoalDTO,
    LearningStatisticsDTO,
    BadgeDTO,
    LevelXpDTO,
    LearnerProfileDetailDTO,
    UpdateProfileRequest,
    SkillNodeDTO,
    UserSettingsDTO,
    UpdateSettingsRequest
)

router = APIRouter(prefix="/learner", tags=["02 · Trang chủ, Gamification & Hồ sơ (S10–S24)"])

@router.get("/home", summary="Trang chủ học viên tổng hợp (S10)")
def get_learner_home(
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
) -> Dict[str, Any]:
    """Tổng hợp dữ liệu trang chủ: Quests, Streak, Danh mục nhanh, Khóa học đề xuất (S10)"""
    prof = current_user.profile
    
    # 1. Daily Quests
    quests = db.query(DailyQuest).filter(DailyQuest.user_id == current_user.id).all()
    quests_data = [DailyQuestDTO.model_validate(q) for q in quests]

    # 2. Quick Categories
    categories = db.query(Category).filter(Category.is_featured == True).limit(4).all()
    categories_data = [{"id": c.id, "name": c.name, "icon": c.icon, "color": c.color} for c in categories]

    # 3. Recommended Courses (Applied Data Wrangling, Product Design Thinking...)
    recommended_courses = db.query(Course).filter(Course.is_featured == True).limit(4).all()
    courses_data = [
        {
            "id": c.id,
            "title": c.title,
            "category_name": c.category.name if c.category else "Technology",
            "instructor_name": c.instructor.name if c.instructor else "Ms. Lan",
            "thumbnail_url": c.thumbnail_url,
            "price": c.price,
            "is_free": c.is_free,
            "rating": c.rating,
            "duration_hours": c.duration_hours
        }
        for c in recommended_courses
    ]

    return {
        "user_name": current_user.full_name,
        "avatar_url": prof.avatar_url if prof else "",
        "streak_count": prof.streak_count if prof else 0,
        "xp": prof.xp if prof else 0,
        "level": prof.level if prof else 1,
        "daily_quests": quests_data,
        "quick_categories": categories_data,
        "recommended_courses": courses_data
    }

@router.get("/study-plan", response_model=List[StudyPlanItemDTO], summary="Kế hoạch học tập hôm nay (S11)")
def get_study_plan(
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Lấy danh sách các bài học cần hoàn thành trong kế hoạch hôm nay (S11)"""
    items = db.query(StudyPlanItem).filter(StudyPlanItem.user_id == current_user.id).order_index = StudyPlanItem.order_index
    items = db.query(StudyPlanItem).filter(StudyPlanItem.user_id == current_user.id).order_by(StudyPlanItem.order_index.asc()).all()
    return items

@router.post("/study-plan/{item_id}/toggle", summary="Đánh dấu hoàn thành bài học trong kế hoạch (S11)")
def toggle_study_plan_item(
    item_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Bật / tắt trạng thái hoàn thành của một mục kế hoạch học tập"""
    item = db.query(StudyPlanItem).filter(
        StudyPlanItem.id == item_id,
        StudyPlanItem.user_id == current_user.id
    ).first()
    if not item:
        raise HTTPException(status_code=404, detail="Không tìm thấy mục học tập.")
    
    item.is_completed = not item.is_completed
    db.commit()
    return {"id": item.id, "is_completed": item.is_completed}

@router.get("/streak", response_model=StudyStreakDTO, summary="Chuỗi ngày học liên tục (S12)")
def get_streak_details(
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Lấy số ngày streak, số lượng bảo vệ chuỗi (Freeze) và lịch học tháng (S12)"""
    prof = current_user.profile
    logs = db.query(StudyStreakLog).filter(StudyStreakLog.user_id == current_user.id).all()
    
    active_days = [l.log_date.isoformat() for l in logs if l.is_active_day]
    freeze_days = [l.log_date.isoformat() for l in logs if l.used_freeze]

    return StudyStreakDTO(
        streak_count=prof.streak_count if prof else 12,
        longest_streak=prof.longest_streak if prof else 24,
        freeze_streak_count=prof.freeze_streak_count if prof else 2,
        active_days_this_month=active_days,
        freeze_used_dates=freeze_days
    )

@router.post("/streak/freeze", summary="Kích hoạt vật phẩm bảo vệ chuỗi Freeze Streak (S12)")
def use_streak_freeze(
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Sử dụng 1 bình bảo vệ Streak để giữ nguyên chuỗi khi không thể học"""
    prof = current_user.profile
    if not prof or prof.freeze_streak_count <= 0:
        raise HTTPException(status_code=400, detail="Bạn đã hết lượt đóng băng chuỗi Streak.")
    
    prof.freeze_streak_count -= 1
    new_log = StudyStreakLog(
        user_id=current_user.id,
        log_date=date.today(),
        minutes_studied=0,
        is_active_day=False,
        used_freeze=True
    )
    db.add(new_log)
    db.commit()
    return {"message": "Đã kích hoạt bảo vệ chuỗi thành công!", "remaining_freeze": prof.freeze_streak_count}

@router.get("/weekly-goals", response_model=WeeklyGoalDTO, summary="Mục tiêu học tập hàng tuần (S13)")
def get_weekly_goals(
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Lấy số giờ học mục tiêu tuần này vs số giờ thực tế đã học (S13)"""
    log = db.query(WeeklyGoalLog).filter(WeeklyGoalLog.user_id == current_user.id).first()
    if not log:
        return WeeklyGoalDTO(
            week_number=45,
            target_hours=7.0,
            completed_hours=5.5,
            daily_breakdown={"Thứ 2": 1.2, "Thứ 3": 0.8, "Thứ 4": 1.5, "Thứ 5": 1.0, "Thứ 6": 1.0, "Thứ 7": 0.0, "Chủ Nhật": 0.0},
            percent_completed=78.5
        )
    pct = round((log.completed_hours / log.target_hours * 100), 1) if log.target_hours > 0 else 0
    return WeeklyGoalDTO(
        week_number=log.week_number,
        target_hours=log.target_hours,
        completed_hours=log.completed_hours,
        daily_breakdown=log.daily_breakdown or {},
        percent_completed=pct
    )

@router.get("/statistics", response_model=LearningStatisticsDTO, summary="Báo cáo thống kê tiến độ học (S14)")
def get_learning_statistics(
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Lấy tổng hợp thời lượng học tập, tỉ lệ hoàn thành bài, biểu đồ xu hướng (S14)"""
    prof = current_user.profile
    return LearningStatisticsDTO(
        total_study_hours=prof.total_study_hours if prof else 48.5,
        courses_completed=prof.courses_completed if prof else 3,
        certificates_count=prof.certificates_count if prof else 2,
        avg_daily_minutes=prof.daily_study_minutes if prof else 35,
        weekly_trend=[
            {"week": "Tuần 1", "hours": 4.5},
            {"week": "Tuần 2", "hours": 6.2},
            {"week": "Tuần 3", "hours": 5.8},
            {"week": "Tuần 4", "hours": 7.0}
        ],
        top_categories=[
            {"name": "Python & Data Science", "hours": "24.5h"},
            {"name": "UI/UX Design Systems", "hours": "18.0h"},
            {"name": "English for Tech", "hours": "6.0h"}
        ]
    )

@router.get("/badges", response_model=List[BadgeDTO], summary="Bộ sưu tập huy hiệu thành tích (S15)")
def get_badges(
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Lấy danh sách các huy hiệu đã mở khóa và còn khóa (S15)"""
    badges = db.query(Badge).all()
    unlocked_ids = {
        ub.badge_id for ub in db.query(UserBadge).filter(
            UserBadge.user_id == current_user.id,
            UserBadge.is_unlocked == True
        ).all()
    }
    
    result = []
    for b in badges:
        dto = BadgeDTO(
            id=b.id,
            code=b.code,
            name=b.name,
            description=b.description or "",
            category=b.category,
            icon=b.icon,
            rarity=b.rarity,
            xp_bonus=b.xp_bonus,
            is_unlocked=(b.id in unlocked_ids)
        )
        result.append(dto)
    return result

@router.get("/level-xp", response_model=LevelXpDTO, summary="Cấp độ và điểm kinh nghiệm XP (S16)")
def get_level_xp(current_user: User = Depends(get_current_user)):
    """Lấy chi tiết Level, XP tích lũy và xếp hạng (S16)"""
    prof = current_user.profile
    curr_xp = prof.xp if prof else 1250
    curr_level = prof.level if prof else 5
    next_level_xp = curr_level * 300
    progress = round((curr_xp % 300) / 300 * 100, 1)

    return LevelXpDTO(
        current_level=curr_level,
        current_xp=curr_xp,
        xp_for_next_level=next_level_xp,
        progress_percent=progress,
        rank_title="Nhà Khám Phá Tri Thức (Knowledge Seeker)",
        leaderboard_rank=3
    )

@router.get("/daily-quests", response_model=List[DailyQuestDTO], summary="Danh sách nhiệm vụ hàng ngày (S17)")
def get_daily_quests(
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Lấy tất cả các nhiệm vụ ngày hôm nay và tiến độ hoàn thành (S17)"""
    quests = db.query(DailyQuest).filter(DailyQuest.user_id == current_user.id).all()
    return quests

@router.post("/daily-quests/{quest_id}/claim", summary="Nhận thưởng kinh nghiệm XP từ nhiệm vụ (S17)")
def claim_quest_reward(
    quest_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Nhận XP thưởng khi nhiệm vụ đã hoàn thành"""
    quest = db.query(DailyQuest).filter(
        DailyQuest.id == quest_id,
        DailyQuest.user_id == current_user.id
    ).first()
    if not quest:
        raise HTTPException(status_code=404, detail="Không tìm thấy nhiệm vụ.")
    if quest.is_claimed:
        raise HTTPException(status_code=400, detail="Nhiệm vụ này đã nhận thưởng rồi.")
    
    quest.is_claimed = True
    if current_user.profile:
        current_user.profile.xp += quest.reward_xp
    db.commit()

    return {"message": f"Chúc mừng! Bạn đã nhận được +{quest.reward_xp} XP", "new_total_xp": current_user.profile.xp if current_user.profile else quest.reward_xp}

@router.get("/profile", response_model=LearnerProfileDetailDTO, summary="Hồ sơ cá nhân học viên (S18)")
def get_profile_details(current_user: User = Depends(get_current_user)):
    """Lấy toàn bộ thông tin chi tiết hồ sơ học viên (S18)"""
    prof = current_user.profile
    return LearnerProfileDetailDTO(
        id=prof.id if prof else 1,
        user_id=current_user.id,
        full_name=current_user.full_name,
        email=current_user.email,
        avatar_url=prof.avatar_url if prof else "",
        bio=prof.bio if prof else "",
        phone=prof.phone if prof else "",
        current_level=prof.current_level if prof else "Intermediate",
        daily_study_minutes=prof.daily_study_minutes if prof else 30,
        xp=prof.xp if prof else 0,
        level=prof.level if prof else 1,
        streak_count=prof.streak_count if prof else 0,
        total_study_hours=prof.total_study_hours if prof else 0.0,
        courses_completed=prof.courses_completed if prof else 0,
        certificates_count=prof.certificates_count if prof else 0
    )

@router.put("/profile", summary="Chỉnh sửa thông tin hồ sơ (S19)")
def update_profile(
    payload: UpdateProfileRequest,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Cập nhật họ tên, bio, số điện thoại, avatar (S19)"""
    if payload.full_name:
        current_user.full_name = payload.full_name
    
    prof = current_user.profile
    if prof:
        if payload.bio is not None:
            prof.bio = payload.bio
        if payload.phone is not None:
            prof.phone = payload.phone
        if payload.avatar_url is not None:
            prof.avatar_url = payload.avatar_url
        if payload.daily_study_minutes is not None:
            prof.daily_study_minutes = payload.daily_study_minutes
    db.commit()
    return {"message": "Cập nhật hồ sơ thành công!"}

@router.get("/skill-tree", response_model=List[SkillNodeDTO], summary="Cây kỹ năng năng lực (S20)")
def get_skill_tree(db: Session = Depends(get_db)):
    """Lấy danh sách các node kỹ năng trong Cây kỹ năng (S20)"""
    skills = db.query(SkillNode).all()
    return skills

@router.get("/share-card", summary="Dữ liệu thẻ chia sẻ thành tích (S21)")
def get_share_card_data(current_user: User = Depends(get_current_user)):
    """Lấy thông số để tạo ảnh / thẻ chia sẻ thành tích lên mạng xã hội (S21)"""
    prof = current_user.profile
    return {
        "student_name": current_user.full_name,
        "avatar_url": prof.avatar_url if prof else "",
        "streak_days": prof.streak_count if prof else 12,
        "total_xp": prof.xp if prof else 1250,
        "badges_count": 8,
        "top_skill": "Data Wrangling with Pandas",
        "quote": "Kiên trì mỗi ngày cùng EduPath để chạm tới ước mơ kỹ sư công nghệ!"
    }

@router.get("/settings", response_model=UserSettingsDTO, summary="Cài đặt học tập & trợ năng (S22-S24)")
def get_user_settings(current_user: User = Depends(get_current_user)):
    """Lấy cài đặt phát video (S22), nhắc nhở học (S23) và trợ năng hiển thị (S24)"""
    sett = current_user.settings
    if not sett:
        return UserSettingsDTO(
            auto_play_video=True,
            default_subtitles="vi",
            playback_speed=1.0,
            daily_reminder_enabled=True,
            reminder_time="20:00",
            dark_mode=True,
            font_size="medium",
            high_contrast=False,
            reduce_motion=False
        )
    return sett

@router.put("/settings", summary="Cập nhật cài đặt học tập & trợ năng (S22-S24)")
def update_user_settings(
    payload: UpdateSettingsRequest,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Cập nhật tùy chọn hiển thị và học tập"""
    sett = current_user.settings
    if not sett:
        sett = UserSettings(user_id=current_user.id)
        db.add(sett)
    
    update_data = payload.model_dump(exclude_unset=True)
    for k, v in update_data.items():
        setattr(sett, k, v)
        
    db.commit()
    return {"message": "Cập nhật cài đặt thành công!"}
