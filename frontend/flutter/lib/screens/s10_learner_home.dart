import 'package:flutter/material.dart';
import '../widgets/figma_screen.dart';

/// Màn hình: S10 – Learner home (Figma UI chuẩn xác cho người dùng)
/// Mã: S10 | Kích thước thiết kế: 390 x 1398 px
class S10LearnerHomeScreen extends StatelessWidget {
  const S10LearnerHomeScreen({super.key});

  static const routeName = '/s10_learner_home';

  @override
  Widget build(BuildContext context) {
    return FigmaScreen(
      width: 390,
      height: 1398.00,
      background: const Color(0xFFF9F9FF),
      screenCode: 'S10',
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/S10LearnerHome.png',
            width: 390.0,
            height: 1398.0,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          // Hotspot: Button - Notifications -> S87Notifications
          Positioned(
            left: 294.0,
            top: 10.0,
            width: 44.0,
            height: 44.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s87_notifications');
                },
              ),
            ),
          ),
          // Hotspot: Background -> S18PersonalProfile
          Positioned(
            left: 342.0,
            top: 16.0,
            width: 32.0,
            height: 32.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s18_personal_profile');
                },
              ),
            ),
          ),
          // Hotspot: Link - Streak details -> S12StudyStreak
          Positioned(
            left: 135.7,
            top: 94.0,
            width: 82.0,
            height: 24.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s12_study_streak');
                },
              ),
            ),
          ),
          // Hotspot: Link - XP details -> S16LevelAndXp
          Positioned(
            left: 223.7,
            top: 94.0,
            width: 74.3,
            height: 24.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s16_level_and_xp');
                },
              ),
            ),
          ),
          // Hotspot: Link - Messages -> S88Inbox
          Positioned(
            left: 304.0,
            top: 90.0,
            width: 32.0,
            height: 32.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s88_inbox');
                },
              ),
            ),
          ),
          // Hotspot: Link - Notifications -> S87Notifications
          Positioned(
            left: 342.0,
            top: 90.0,
            width: 32.0,
            height: 32.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s87_notifications');
                },
              ),
            ),
          ),
          // Hotspot: Link - Search Bar (S27) -> S27Search
          Positioned(
            left: 16.0,
            top: 136.0,
            width: 358.0,
            height: 44.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s27_search');
                },
              ),
            ),
          ),
          // Hotspot: Link -> S30CourseDetails
          Positioned(
            left: 32.0,
            top: 232.0,
            width: 326.0,
            height: 22.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s30_course_details');
                },
              ),
            ),
          ),
          // Hotspot: Link - Primary Action CTA Button -> S36VideoPlayer
          Positioned(
            left: 32.0,
            top: 324.0,
            width: 326.0,
            height: 48.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s36_video_player');
                },
              ),
            ),
          ),
          // Hotspot: Link → View all (5 tasks) → -> S11TodaySStudyPlan
          Positioned(
            left: 246.4,
            top: 428.0,
            width: 111.6,
            height: 14.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s11_today_s_study_plan');
                },
              ),
            ),
          ),
          // Hotspot: Text -> S49MultipleChoiceQuiz
          Positioned(
            left: 70.0,
            top: 564.0,
            width: 66.2,
            height: 20.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s49_multiple_choice_quiz');
                },
              ),
            ),
          ),
          // Hotspot: Link - Study schedule -> S77StudySchedule
          Positioned(
            left: 32.0,
            top: 614.0,
            width: 145.0,
            height: 44.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s77_study_schedule');
                },
              ),
            ),
          ),
          // Hotspot: Study schedule → -> S11TodaySStudyPlan
          Positioned(
            left: 32.0,
            top: 629.0,
            width: 102.0,
            height: 14.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s11_today_s_study_plan');
                },
              ),
            ),
          ),
          // Hotspot: Link - Weekly goals -> S13WeeklyGoals
          Positioned(
            left: 201.0,
            top: 614.0,
            width: 145.0,
            height: 44.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s13_weekly_goals');
                },
              ),
            ),
          ),
          // Hotspot: Weekly goals → -> S11TodaySStudyPlan
          Positioned(
            left: 201.0,
            top: 629.0,
            width: 89.0,
            height: 14.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s11_today_s_study_plan');
                },
              ),
            ),
          ),
          // Hotspot: Link -> S17DailyQuests
          Positioned(
            left: 221.0,
            top: 761.0,
            width: 125.0,
            height: 26.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s17_daily_quests');
                },
              ),
            ),
          ),
          // Hotspot: Link -> S26CourseCategories
          Positioned(
            left: 314.9,
            top: 936.0,
            width: 59.1,
            height: 14.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s26_course_categories');
                },
              ),
            ),
          ),
          // Hotspot: Link - Pill: Python (Selected) -> S26CourseCategories
          Positioned(
            left: 16.0,
            top: 958.0,
            width: 95.6,
            height: 36.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s26_course_categories');
                },
              ),
            ),
          ),
          // Hotspot: Link - Pill: English A2 -> S26CourseCategories
          Positioned(
            left: 122.2,
            top: 958.0,
            width: 117.3,
            height: 36.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s26_course_categories');
                },
              ),
            ),
          ),
          // Hotspot: Link - Pill: UI/UX -> S26CourseCategories
          Positioned(
            left: 248.8,
            top: 958.0,
            width: 86.8,
            height: 36.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s26_course_categories');
                },
              ),
            ),
          ),
          // Hotspot: Link - Pill: Data Science -> S26CourseCategories
          Positioned(
            left: 346.2,
            top: 958.0,
            width: 137.9,
            height: 36.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s26_course_categories');
                },
              ),
            ),
          ),
          // Hotspot: Link - Pill: Logic -> S26CourseCategories
          Positioned(
            left: 493.4,
            top: 958.0,
            width: 84.5,
            height: 36.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s26_course_categories');
                },
              ),
            ),
          ),
          // Hotspot: Link -> S48NextCourseRecommendations
          Positioned(
            left: 320.7,
            top: 1029.0,
            width: 53.3,
            height: 14.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s48_next_course_recommendations');
                },
              ),
            ),
          ),
          // Hotspot: Link - Recommended Course 1 -> S30CourseDetails
          Positioned(
            left: 16.0,
            top: 1062.0,
            width: 358.0,
            height: 114.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s30_course_details');
                },
              ),
            ),
          ),
          // Hotspot: Link - Recommended Course 2 -> S30CourseDetails
          Positioned(
            left: 16.0,
            top: 1192.0,
            width: 358.0,
            height: 118.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s30_course_details');
                },
              ),
            ),
          ),
          // Hotspot: GO:S25 / Explore -> S25Explore
          Positioned(
            left: 78.6,
            top: 1341.0,
            width: 77.6,
            height: 52.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s25_explore');
                },
              ),
            ),
          ),
          // Hotspot: GO:S46 / Courses -> S46MyCourses
          Positioned(
            left: 156.2,
            top: 1341.0,
            width: 77.6,
            height: 52.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s46_my_courses');
                },
              ),
            ),
          ),
          // Hotspot: GO:S79 / Community -> S79Forum
          Positioned(
            left: 233.8,
            top: 1341.0,
            width: 77.6,
            height: 52.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s79_forum');
                },
              ),
            ),
          ),
          // Hotspot: GO:S18 / Profile -> S18PersonalProfile
          Positioned(
            left: 311.4,
            top: 1341.0,
            width: 77.6,
            height: 52.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s18_personal_profile');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
