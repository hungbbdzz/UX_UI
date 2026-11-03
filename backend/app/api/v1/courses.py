# -*- coding: utf-8 -*-
"""
EduPath Backend - Router: Khám phá, Tìm kiếm & Chi tiết Khóa học (S25-S35)
"""

from typing import List, Optional
from fastapi import APIRouter, Depends, HTTPException, Query, status
from sqlalchemy.orm import Session
from sqlalchemy import or_

from app.core.database import get_db
from app.api.deps import get_current_user
from app.models.user import User
from app.models.course import (
    Category,
    Instructor,
    Course,
    CourseSection,
    Lesson,
    CourseReview
)
from app.models.cohort_exam import CourseEnrollment
from app.schemas.course import (
    CategoryDTO,
    InstructorDTO,
    CourseSummaryDTO,
    CourseDetailDTO,
    CourseSectionDTO,
    LessonSummaryDTO,
    CourseReviewDTO,
    CreateReviewRequest,
    CourseComparisonDTO
)

router = APIRouter(prefix="/courses", tags=["03 · Khám phá, Tìm kiếm & Khóa học (S25–S35)"])

@router.get("/explore", summary="Trang khám phá tổng hợp (S25)")
def get_explore_page(db: Session = Depends(get_db)):
    """Lấy dữ liệu trang Khám phá: Banners, Khóa học thịnh hành, Giảng viên tiêu biểu (S25)"""
    banners = [
        {
            "id": 1,
            "title": "Chinh phục Khoa học Dữ liệu 2026",
            "subtitle": "Giảm ngay 40% cho sinh viên IT",
            "image_url": "https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=800",
            "badge": "Hot Deal"
        },
        {
            "id": 2,
            "title": "UX/UI Design Thinking & Figma Systems",
            "subtitle": "Học cùng chuyên gia hàng đầu",
            "image_url": "https://images.unsplash.com/photo-1581291518655-9523c9320cf6?w=800",
            "badge": "Xu Hướng"
        }
    ]

    trending_courses = db.query(Course).filter(Course.is_trending == True).all()
    featured_courses = db.query(Course).filter(Course.is_featured == True).all()
    instructors = db.query(Instructor).limit(4).all()

    def map_course(c):
        return {
            "id": c.id,
            "title": c.title,
            "slug": c.slug,
            "category_name": c.category.name if c.category else "General",
            "instructor_name": c.instructor.name if c.instructor else "Ms. Lan",
            "thumbnail_url": c.thumbnail_url,
            "price": c.price,
            "original_price": c.original_price,
            "is_free": c.is_free,
            "rating": c.rating,
            "duration_hours": c.duration_hours,
            "students_enrolled": c.students_enrolled
        }

    return {
        "banners": banners,
        "trending_courses": [map_course(c) for c in trending_courses],
        "featured_courses": [map_course(c) for c in featured_courses],
        "top_instructors": [
            {
                "id": ins.id,
                "name": ins.name,
                "title": ins.title,
                "avatar_url": ins.avatar_url,
                "average_rating": ins.average_rating,
                "total_students": ins.total_students
            }
            for ins in instructors
        ]
    }

@router.get("/categories", response_model=List[CategoryDTO], summary="Danh mục khóa học phân cấp (S26)")
def get_categories(db: Session = Depends(get_db)):
    """Lấy danh mục các chuyên ngành: Python, Thiết kế UI/UX, Web Dev, Mobile App, AI... (S26)"""
    categories = db.query(Category).all()
    return categories

@router.get("/filters", summary="Danh sách tùy chọn bộ lọc nâng cao (S28)")
def get_available_filters():
    """Lấy các tiêu chí lọc: Mức giá, Trình độ, Xếp hạng sao, Thời lượng khóa học (S28)"""
    return {
        "price_options": [
            {"id": "all", "label": "Tất cả"},
            {"id": "free", "label": "Miễn phí (Free)"},
            {"id": "paid", "label": "Có phí"}
        ],
        "levels": [
            {"id": "all", "label": "Mọi trình độ"},
            {"id": "Beginner", "label": "Người mới bắt đầu"},
            {"id": "Intermediate", "label": "Trung cấp"},
            {"id": "Advanced", "label": "Nâng cao"}
        ],
        "ratings": [
            {"min_stars": 4.5, "label": "4.5 sao trở lên"},
            {"min_stars": 4.0, "label": "4.0 sao trở lên"},
            {"min_stars": 3.0, "label": "3.0 sao trở lên"}
        ],
        "durations": [
            {"id": "short", "label": "0 - 3 giờ"},
            {"id": "medium", "label": "3 - 6 giờ"},
            {"id": "long", "label": "6+ giờ"}
        ]
    }

@router.get("/search", summary="Tìm kiếm khóa học & Lọc kết quả (S27, S29)")
def search_courses(
    q: Optional[str] = Query(None, description="Từ khóa tìm kiếm"),
    category_id: Optional[int] = Query(None, description="ID danh mục"),
    level: Optional[str] = Query(None, description="Trình độ"),
    is_free: Optional[bool] = Query(None, description="Chỉ lấy khóa miễn phí"),
    min_rating: Optional[float] = Query(None, description="Xếp hạng sao tối thiểu"),
    sort_by: str = Query("popularity", description="Sắp xếp: popularity, rating, newest, price_asc, price_desc"),
    db: Session = Depends(get_db)
):
    """Tìm kiếm đa năng có hỗ trợ từ khóa, bộ lọc nhiều thuộc tính và phân loại kết quả (S27, S29)"""
    query = db.query(Course)

    if q:
        search_pattern = f"%{q}%"
        query = query.filter(
            or_(
                Course.title.ilike(search_pattern),
                Course.description.ilike(search_pattern)
            )
        )

    if category_id:
        query = query.filter(Course.category_id == category_id)

    if level and level != "all":
        query = query.filter(Course.level == level)

    if is_free is not None:
        query = query.filter(Course.is_free == is_free)

    if min_rating:
        query = query.filter(Course.rating >= min_rating)

    # Sắp xếp
    if sort_by == "rating":
        query = query.order_by(Course.rating.desc())
    elif sort_by == "newest":
        query = query.order_by(Course.created_at.desc())
    elif sort_by == "price_asc":
        query = query.order_by(Course.price.asc())
    elif sort_by == "price_desc":
        query = query.order_by(Course.price.desc())
    else:
        query = query.order_by(Course.students_enrolled.desc())

    courses = query.all()

    return {
        "query": q,
        "total_results": len(courses),
        "courses": [
            {
                "id": c.id,
                "title": c.title,
                "slug": c.slug,
                "category_name": c.category.name if c.category else "Technology",
                "instructor_name": c.instructor.name if c.instructor else "Ms. Lan",
                "thumbnail_url": c.thumbnail_url,
                "price": c.price,
                "original_price": c.original_price,
                "is_free": c.is_free,
                "level": c.level,
                "rating": c.rating,
                "reviews_count": c.reviews_count,
                "duration_hours": c.duration_hours,
                "total_lessons": c.total_lessons,
                "students_enrolled": c.students_enrolled
            }
            for c in courses
        ]
    }

@router.get("/compare", summary="So sánh chi tiết giữa các khóa học (S34)")
def compare_courses(
    course_ids: List[int] = Query(..., description="Danh sách ID các khóa học cần so sánh"),
    db: Session = Depends(get_db)
):
    """Bảng so sánh đa chiều: Giá, Giảng viên, Thời lượng, Bài học, Đánh giá, Điểm mạnh (S34)"""
    courses = db.query(Course).filter(Course.id.in_(course_ids)).all()
    if not courses:
        raise HTTPException(status_code=404, detail="Không tìm thấy khóa học để so sánh.")

    items = []
    for c in courses:
        items.append({
            "id": c.id,
            "title": c.title,
            "instructor": c.instructor.name if c.instructor else "Ms. Lan",
            "price_formatted": "Miễn phí" if c.is_free else f"{c.price:,.0f} đ",
            "duration": f"{c.duration_hours} giờ",
            "lessons": f"{c.total_lessons} bài học",
            "rating": f"⭐ {c.rating} ({c.reviews_count})",
            "level": c.level,
            "highlights": (c.what_you_will_learn or [])[:3]
        })

    return {
        "compared_courses": items,
        "recommendation": f"Nếu bạn muốn nền tảng vững vàng, '{courses[0].title}' là lựa chọn hàng đầu!"
    }

@router.get("/{course_id}", summary="Thông tin chi tiết khóa học (S30)")
def get_course_detail(
    course_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Lấy chi tiết khóa học: Giảng viên, đề cương, đánh giá và trạng thái đăng ký (S30)"""
    course = db.query(Course).filter(Course.id == course_id).first()
    if not course:
        raise HTTPException(status_code=404, detail="Không tìm thấy khóa học.")

    # Kiểm tra xem user hiện tại đã đăng ký chưa
    is_enrolled = False
    if current_user:
        enrollment = db.query(CourseEnrollment).filter(
            CourseEnrollment.user_id == current_user.id,
            CourseEnrollment.course_id == course_id
        ).first()
        is_enrolled = (enrollment is not None)

    # Đề cương tóm tắt
    sections = []
    for s in course.sections:
        lessons = [
            {
                "id": l.id,
                "title": l.title,
                "lesson_type": l.lesson_type,
                "duration_minutes": l.duration_minutes,
                "is_preview": l.is_preview,
                "order_index": l.order_index
            }
            for l in s.lessons
        ]
        sections.append({
            "id": s.id,
            "title": s.title,
            "order_index": s.order_index,
            "lessons": lessons
        })

    # Đánh giá học viên
    reviews = [
        {
            "id": r.id,
            "user_name": r.user_name,
            "user_avatar": r.user_avatar,
            "rating": r.rating,
            "comment": r.comment,
            "created_at": r.created_at
        }
        for r in course.reviews[:5]
    ]

    ins = course.instructor
    instructor_dto = {
        "id": ins.id if ins else 1,
        "name": ins.name if ins else "Ms. Lan",
        "title": ins.title if ins else "Giảng viên",
        "organization": ins.organization if ins else "VKU",
        "avatar_url": ins.avatar_url if ins else "",
        "bio": ins.bio if ins else "",
        "total_students": ins.total_students if ins else 1000,
        "average_rating": ins.average_rating if ins else 4.9,
        "total_courses": ins.total_courses if ins else 3
    }

    return {
        "id": course.id,
        "title": course.title,
        "slug": course.slug,
        "category_id": course.category_id,
        "category_name": course.category.name if course.category else "",
        "instructor": instructor_dto,
        "thumbnail_url": course.thumbnail_url,
        "price": course.price,
        "original_price": course.original_price,
        "is_free": course.is_free,
        "level": course.level,
        "duration_hours": course.duration_hours,
        "total_lessons": course.total_lessons,
        "rating": course.rating,
        "reviews_count": course.reviews_count,
        "students_enrolled": course.students_enrolled,
        "description": course.description or "",
        "what_you_will_learn": course.what_you_will_learn or [],
        "requirements": course.requirements or [],
        "sections": sections,
        "reviews": reviews,
        "is_enrolled": is_enrolled
    }

@router.get("/{course_id}/syllabus", summary="Đề cương toàn diện của khóa học (S31)")
def get_course_syllabus(course_id: int, db: Session = Depends(get_db)):
    """Lấy danh sách các chương và toàn bộ bài học (S31)"""
    course = db.query(Course).filter(Course.id == course_id).first()
    if not course:
        raise HTTPException(status_code=404, detail="Không tìm thấy khóa học.")

    sections = []
    for s in course.sections:
        lessons = [
            {
                "id": l.id,
                "title": l.title,
                "lesson_type": l.lesson_type,
                "duration_minutes": l.duration_minutes,
                "is_preview": l.is_preview,
                "order_index": l.order_index
            }
            for l in s.lessons
        ]
        sections.append({
            "id": s.id,
            "title": s.title,
            "order_index": s.order_index,
            "lessons": lessons
        })

    return {
        "course_id": course.id,
        "course_title": course.title,
        "total_sections": len(sections),
        "total_lessons": sum(len(s["lessons"]) for s in sections),
        "sections": sections
    }

@router.get("/instructors/{instructor_id}", summary="Hồ sơ giảng viên (S32)")
def get_instructor_profile(instructor_id: int, db: Session = Depends(get_db)):
    """Lấy hồ sơ cá nhân và các khóa học do giảng viên này phụ trách (S32)"""
    ins = db.query(Instructor).filter(Instructor.id == instructor_id).first()
    if not ins:
        raise HTTPException(status_code=404, detail="Không tìm thấy giảng viên.")

    courses = [
        {
            "id": c.id,
            "title": c.title,
            "thumbnail_url": c.thumbnail_url,
            "price": c.price,
            "rating": c.rating,
            "students_enrolled": c.students_enrolled
        }
        for c in ins.courses
    ]

    return {
        "id": ins.id,
        "name": ins.name,
        "title": ins.title,
        "organization": ins.organization,
        "avatar_url": ins.avatar_url,
        "bio": ins.bio,
        "total_students": ins.total_students,
        "average_rating": ins.average_rating,
        "total_courses": len(courses),
        "courses": courses
    }

@router.get("/{course_id}/reviews", summary="Danh sách đánh giá & nhận xét khóa học (S33)")
def get_course_reviews(course_id: int, db: Session = Depends(get_db)):
    """Lấy danh sách các bài nhận xét của học viên kèm phân bố sao (S33)"""
    reviews = db.query(CourseReview).filter(CourseReview.course_id == course_id).all()
    
    star_breakdown = {5: 0, 4: 0, 3: 0, 2: 0, 1: 0}
    for r in reviews:
        star_breakdown[r.rating] = star_breakdown.get(r.rating, 0) + 1

    return {
        "course_id": course_id,
        "total_reviews": len(reviews),
        "star_distribution": star_breakdown,
        "reviews": [
            {
                "id": r.id,
                "user_name": r.user_name,
                "user_avatar": r.user_avatar,
                "rating": r.rating,
                "comment": r.comment,
                "created_at": r.created_at
            }
            for r in reviews
        ]
    }

@router.post("/{course_id}/reviews", status_code=status.HTTP_201_CREATED, summary="Gửi bài đánh giá mới (S33)")
def submit_course_review(
    course_id: int,
    payload: CreateReviewRequest,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Học viên để lại nhận xét và chấm điểm cho khóa học đã hoàn thành"""
    course = db.query(Course).filter(Course.id == course_id).first()
    if not course:
        raise HTTPException(status_code=404, detail="Khóa học không tồn tại.")

    prof = current_user.profile
    review = CourseReview(
        course_id=course_id,
        user_id=current_user.id,
        user_name=current_user.full_name,
        user_avatar=prof.avatar_url if prof else "",
        rating=payload.rating,
        comment=payload.comment
    )
    db.add(review)
    course.reviews_count += 1
    db.commit()

    return {"message": "Cảm ơn bạn đã gửi đánh giá!", "review_id": review.id}

@router.get("/lessons/{lesson_id}/preview", summary="Xem thử bài học miễn phí trước khi đăng ký (S35)")
def get_lesson_preview(lesson_id: int, db: Session = Depends(get_db)):
    """Cho phép học thử bài học có gắn cờ preview (S35)"""
    lesson = db.query(Lesson).filter(Lesson.id == lesson_id).first()
    if not lesson:
        raise HTTPException(status_code=404, detail="Không tìm thấy bài học.")
    if not lesson.is_preview:
        raise HTTPException(status_code=403, detail="Bài học này yêu cầu đăng ký khóa học.")

    return {
        "lesson_id": lesson.id,
        "title": lesson.title,
        "lesson_type": lesson.lesson_type,
        "duration_minutes": lesson.duration_minutes,
        "video_url": lesson.video_url,
        "reading_content": lesson.reading_content,
        "slide_url": lesson.slide_url,
        "is_preview": True
    }
