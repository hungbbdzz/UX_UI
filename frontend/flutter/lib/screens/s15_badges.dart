import 'package:flutter/material.dart';
import '../widgets/figma_screen.dart';

/// Màn hình: S15 – Badges (Figma UI chuẩn xác cho người dùng)
/// Mã: S15 | Kích thước thiết kế: 390 x 1042 px
class S15BadgesScreen extends StatelessWidget {
  const S15BadgesScreen({super.key});

  static const routeName = '/s15_badges';

  @override
  Widget build(BuildContext context) {
    return FigmaScreen(
      width: 390,
      height: 1042.00,
      background: const Color(0xFFF9F9FF),
      screenCode: 'S15',
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/S15Badges.png',
            width: 390.0,
            height: 1042.0,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          // Hotspot: Button - Back:margin -> GoBack
          Positioned(
            left: 16.0,
            top: 8.0,
            width: 32.0,
            height: 40.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  if (Navigator.canPop(context)) Navigator.pop(context);
                },
              ),
            ),
          ),
          // Hotspot: Actions → Button -> S21AchievementSharingCard
          Positioned(
            left: 32.0,
            top: 890.0,
            width: 326.0,
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
          // Hotspot: GO:S10 / Home -> S10LearnerHome
          Positioned(
            left: 1.0,
            top: 985.0,
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
            top: 985.0,
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
            top: 985.0,
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
            top: 985.0,
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
            top: 985.0,
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
