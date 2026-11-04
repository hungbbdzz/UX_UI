# -*- coding: utf-8 -*-
"""
EduPath Backend - Bộ Test tự động kiểm tra toàn bộ 6 Routers API
"""

import sys
import os

backend_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
if backend_dir not in sys.path:
    sys.path.insert(0, backend_dir)

from fastapi.testclient import TestClient
from app.main import app

def run_all_tests():
    with TestClient(app) as client:
        print("\n" + "=" * 60)
        print("BẮT ĐẦU CHẠY KIỂM THỬ TOÀN DIỆN EDUPATH BACKEND")
        print("=" * 60)

        # 1. Root & Health
        response = client.get("/")
        assert response.status_code == 200
        data = response.json()
        assert data["project"] == "EduPath - AI Learning Experience Platform"
        assert data["status"] == "ONLINE"
        print("✅ [Pass] Test Root & Health Check")

        # 2. Auth (A01, A02)
        login_res = client.post("/api/v1/auth/login", json={
            "email": "hung.nv@edupath.vn",
            "password": "EduPath2026!"
        })
        assert login_res.status_code == 200, f"Login failed: {login_res.text}"
        token = login_res.json()["access_token"]

        headers = {"Authorization": f"Bearer {token}"}
        me_res = client.get("/api/v1/auth/me", headers=headers)
        assert me_res.status_code == 200
        assert me_res.json()["full_name"] == "Nguyễn Văn Hùng"
        print("✅ [Pass] Test Auth (Login & Profile Me - A01, A02)")

        # 3. Onboarding (S03-S09)
        goals_res = client.get("/api/v1/onboarding/goals")
        assert goals_res.status_code == 200
        assert len(goals_res.json()) >= 4

        interests_res = client.get("/api/v1/onboarding/interests")
        assert interests_res.status_code == 200
        assert len(interests_res.json()) >= 4

        q_res = client.get("/api/v1/onboarding/placement-questions")
        assert q_res.status_code == 200
        assert len(q_res.json()) >= 3

        submit_res = client.post("/api/v1/onboarding/placement-test/submit", json={
            "answers": [
                {"question_id": 1, "selected_option_index": 0},
                {"question_id": 2, "selected_option_index": 1}
            ]
        }, headers=headers)
        assert submit_res.status_code == 200
        assert "score_percent" in submit_res.json()

        paths_res = client.get("/api/v1/onboarding/suggested-paths")
        assert paths_res.status_code == 200
        assert len(paths_res.json()) >= 2
        print("✅ [Pass] Test Onboarding & Placement Test (S03–S09)")

        # 4. Learner Experience & Gamification (S10-S24)
        home_res = client.get("/api/v1/learner/home", headers=headers)
        assert home_res.status_code == 200
        assert "daily_quests" in home_res.json()
        assert "quick_categories" in home_res.json()

        plan_res = client.get("/api/v1/learner/study-plan", headers=headers)
        assert plan_res.status_code == 200
        assert len(plan_res.json()) >= 2

        streak_res = client.get("/api/v1/learner/streak", headers=headers)
        assert streak_res.status_code == 200
        assert streak_res.json()["streak_count"] >= 10

        goals_res = client.get("/api/v1/learner/weekly-goals", headers=headers)
        assert goals_res.status_code == 200

        stats_res = client.get("/api/v1/learner/statistics", headers=headers)
        assert stats_res.status_code == 200

        badges_res = client.get("/api/v1/learner/badges", headers=headers)
        assert badges_res.status_code == 200
        assert len(badges_res.json()) >= 4

        level_res = client.get("/api/v1/learner/level-xp", headers=headers)
        assert level_res.status_code == 200

        quests_res = client.get("/api/v1/learner/daily-quests", headers=headers)
        assert quests_res.status_code == 200
        assert len(quests_res.json()) >= 3

        skills_res = client.get("/api/v1/learner/skill-tree")
        assert skills_res.status_code == 200
        assert len(skills_res.json()) >= 4

        sett_res = client.get("/api/v1/learner/settings", headers=headers)
        assert sett_res.status_code == 200
        print("✅ [Pass] Test Learner Experience & Gamification (S10–S24)")

        # 5. Courses (S25-S35)
        exp_res = client.get("/api/v1/courses/explore")
        assert exp_res.status_code == 200

        cat_res = client.get("/api/v1/courses/categories")
        assert cat_res.status_code == 200
        assert len(cat_res.json()) >= 4

        search_res = client.get("/api/v1/courses/search?q=Pandas")
        assert search_res.status_code == 200
        assert search_res.json()["total_results"] >= 1

        c_res = client.get("/api/v1/courses/1", headers=headers)
        assert c_res.status_code == 200
        assert "Pandas" in c_res.json()["title"]

        syl_res = client.get("/api/v1/courses/1/syllabus")
        assert syl_res.status_code == 200
        assert syl_res.json()["total_lessons"] >= 5

        ins_res = client.get("/api/v1/courses/instructors/1")
        assert ins_res.status_code == 200
        assert ins_res.json()["name"] == "Ms. Lan"

        cmp_res = client.get("/api/v1/courses/compare?course_ids=1&course_ids=2")
        assert cmp_res.status_code == 200
        assert len(cmp_res.json()["compared_courses"]) == 2
        print("✅ [Pass] Test Course Discovery, Details & Compare (S25–S35)")

        # 6. Learning Player (S36-S44)
        lesson_res = client.get("/api/v1/learning/lessons/1", headers=headers)
        assert lesson_res.status_code == 200
        assert lesson_res.json()["title"] is not None

        note_create = client.post("/api/v1/learning/lessons/1/notes", json={
            "timestamp_seconds": 125,
            "note_text": "Ghi chú test lúc 02:05"
        }, headers=headers)
        assert note_create.status_code == 201

        notes_res = client.get("/api/v1/learning/lessons/1/notes", headers=headers)
        assert notes_res.status_code == 200
        assert len(notes_res.json()) >= 1

        glos_res = client.get("/api/v1/learning/glossary")
        assert glos_res.status_code == 200
        assert len(glos_res.json()) >= 4

        focus_res = client.post("/api/v1/learning/focus-session", json={"session_minutes": 25}, headers=headers)
        assert focus_res.status_code == 200
        assert focus_res.json()["xp_earned"] == 20
        print("✅ [Pass] Test Multimedia Learning & Notes (S36–S44)")

        # 7. My Courses & Certificates (S45-S48)
        cohorts_res = client.get("/api/v1/my-courses/cohorts")
        assert cohorts_res.status_code == 200
        assert len(cohorts_res.json()) >= 1

        enrolled_res = client.get("/api/v1/my-courses/enrolled", headers=headers)
        assert enrolled_res.status_code == 200
        assert len(enrolled_res.json()) >= 1

        prog_res = client.get("/api/v1/my-courses/1/progress", headers=headers)
        assert prog_res.status_code == 200

        quiz_res = client.get("/api/v1/my-courses/1/final-quiz")
        assert quiz_res.status_code == 200
        assert len(quiz_res.json()["questions"]) >= 2

        cert_res = client.get("/api/v1/my-courses/2/certificate", headers=headers)
        assert cert_res.status_code == 200
        assert cert_res.json()["certificate_code"] is not None

        rec_res = client.get("/api/v1/my-courses/1/next-recommendations")
        assert rec_res.status_code == 200
        assert len(rec_res.json()) >= 1
        print("✅ [Pass] Test My Courses, Final Exam & Certificate (S45–S48)")

        print("=" * 60)
        print("🎉 TẤT CẢ 6 ROUTERS VÀ 50 MÀN HÌNH ĐÃ PASS KIỂM THỬ 100%!")
        print("=" * 60 + "\n")

if __name__ == "__main__":
    run_all_tests()
