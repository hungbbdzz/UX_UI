import 'package:flutter/material.dart';
import '../widgets/figma_screen.dart';

/// Màn hình: S22 – Learning settings (Figma UI chuẩn xác cho người dùng)
/// Mã: S22 | Kích thước thiết kế: 390 x 1925 px
class S22LearningSettingsScreen extends StatelessWidget {
  const S22LearningSettingsScreen({super.key});

  static const routeName = '/s22_learning_settings';

  @override
  Widget build(BuildContext context) {
    return FigmaScreen(
      width: 390,
      height: 1925.00,
      background: const Color(0xFFF9F9FF),
      screenCode: 'S22',
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/S22LearningSettings.png',
            width: 390.0,
            height: 1925.0,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          // Hotspot: Button - Go back:margin -> GoBack
          Positioned(
            left: 16.0,
            top: 10.0,
            width: 40.0,
            height: 44.0,
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
          // Hotspot: Button - Change learning track -> S03SelectLearningGoal
          Positioned(
            left: 283.7,
            top: 118.0,
            width: 74.3,
            height: 32.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s03_select_learning_goal');
                },
              ),
            ),
          ),
          // Hotspot: Settings row - Study reminders -> S23StudyReminders
          Positioned(
            left: 32.0,
            top: 1413.0,
            width: 326.0,
            height: 44.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s23_study_reminders');
                },
              ),
            ),
          ),
          // Hotspot: Settings row - Display & accessibility -> S24DisplayAndAccessibility
          Positioned(
            left: 32.0,
            top: 1473.0,
            width: 326.0,
            height: 44.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s24_display_and_accessibility');
                },
              ),
            ),
          ),
          // Hotspot: Settings row - Downloads -> S42ManageOfflineDownloads
          Positioned(
            left: 32.0,
            top: 1533.0,
            width: 326.0,
            height: 44.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s42_manage_offline_downloads');
                },
              ),
            ),
          ),
          // Hotspot: Settings row - Premium plan -> S91PremiumPlan
          Positioned(
            left: 32.0,
            top: 1593.0,
            width: 326.0,
            height: 44.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s91_premium_plan');
                },
              ),
            ),
          ),
          // Hotspot: Settings row - Transaction history -> S93TransactionHistory
          Positioned(
            left: 32.0,
            top: 1653.0,
            width: 326.0,
            height: 44.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s93_transaction_history');
                },
              ),
            ),
          ),
          // Hotspot: Button -> S18PersonalProfile
          Positioned(
            left: 16.0,
            top: 1741.0,
            width: 358.0,
            height: 48.0,
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
          // Hotspot: GO:S10 / Home -> S10LearnerHome
          Positioned(
            left: 1.0,
            top: 1868.0,
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
            top: 1868.0,
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
            top: 1868.0,
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
            top: 1868.0,
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
            top: 1868.0,
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
