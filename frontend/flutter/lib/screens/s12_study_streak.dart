import 'package:flutter/material.dart';
import '../widgets/figma_screen.dart';

/// Màn hình: S12 – Study streak (Figma UI chuẩn xác cho người dùng)
/// Mã: S12 | Kích thước thiết kế: 390 x 1184 px
class S12StudyStreakScreen extends StatelessWidget {
  const S12StudyStreakScreen({super.key});

  static const routeName = '/s12_study_streak';

  @override
  Widget build(BuildContext context) {
    return FigmaScreen(
      width: 390,
      height: 1184.00,
      background: const Color(0xFFF9F9FF),
      screenCode: 'S12',
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/S12StudyStreak.png',
            width: 390.0,
            height: 1184.0,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          // Hotspot: GO:S10 / Home -> S10LearnerHome
          Positioned(
            left: 1.0,
            top: 1127.0,
            width: 77.6,
            height: 52.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s10_learner_home');
                },
              ),
            ),
          ),
          // Hotspot: GO:S25 / Explore -> S25Explore
          Positioned(
            left: 78.6,
            top: 1127.0,
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
            top: 1127.0,
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
            top: 1127.0,
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
            top: 1127.0,
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
          // Hotspot: Link -> S21AchievementSharingCard
          Positioned(
            left: 16.0,
            top: 1047.2,
            width: 358.0,
            height: 48.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s21_achievement_sharing_card');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
