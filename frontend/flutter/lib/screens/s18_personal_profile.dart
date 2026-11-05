import 'package:flutter/material.dart';
import '../widgets/figma_screen.dart';

/// Màn hình: S18 – Personal profile (Figma UI chuẩn xác cho người dùng)
/// Mã: S18 | Kích thước thiết kế: 390 x 1740 px
class S18PersonalProfileScreen extends StatelessWidget {
  const S18PersonalProfileScreen({super.key});

  static const routeName = '/s18_personal_profile';

  @override
  Widget build(BuildContext context) {
    return FigmaScreen(
      width: 390,
      height: 1740.00,
      background: const Color(0xFFF9F9FF),
      screenCode: 'S18',
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/S18PersonalProfile.png',
            width: 390.0,
            height: 1740.0,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          // Hotspot: Certificates -> S69Certificates
          Positioned(
            left: 271.1,
            top: 202.0,
            width: 60.0,
            height: 12.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s69_certificates');
                },
              ),
            ),
          ),
          // Hotspot: Badges -> S15Badges
          Positioned(
            left: 287.4,
            top: 268.6,
            width: 50.0,
            height: 19.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s15_badges');
                },
              ),
            ),
          ),
          // Hotspot: Link -> S97InstructorDashboard
          Positioned(
            left: 30.1,
            top: 645.7,
            width: 329.7,
            height: 41.6,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s97instructordashboard');
                },
              ),
            ),
          ),
          // Hotspot: Link - 1. Edit Profile -> S19EditProfile
          Positioned(
            left: 15.1,
            top: 744.5,
            width: 359.9,
            height: 67.8,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s19_edit_profile');
                },
              ),
            ),
          ),
          // Hotspot: Link - 2. Skill Tree -> S20SkillTree
          Positioned(
            left: 15.1,
            top: 819.9,
            width: 359.9,
            height: 67.8,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s20_skill_tree');
                },
              ),
            ),
          ),
          // Hotspot: Link - 3. Weekly Goals -> S13WeeklyGoals
          Positioned(
            left: 15.1,
            top: 895.2,
            width: 359.9,
            height: 67.8,
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
          // Hotspot: Link - 4. Study Settings -> S22LearningSettings
          Positioned(
            left: 15.1,
            top: 970.6,
            width: 359.9,
            height: 67.8,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s22_learning_settings');
                },
              ),
            ),
          ),
          // Hotspot: Link - 5. Refer a Friend -> S95InviteFriends
          Positioned(
            left: 15.1,
            top: 1046.0,
            width: 359.9,
            height: 67.8,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s95_invite_friends');
                },
              ),
            ),
          ),
          // Hotspot: Link - 6. Help & Support -> S96HelpCenter
          Positioned(
            left: 15.1,
            top: 1121.3,
            width: 359.9,
            height: 67.8,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s96_help_center');
                },
              ),
            ),
          ),
          // Hotspot: Link - Learning Statistics -> S14LearningStatistics
          Positioned(
            left: 15.1,
            top: 1196.7,
            width: 359.9,
            height: 67.8,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s14_learning_statistics');
                },
              ),
            ),
          ),
          // Hotspot: Link - Gradebook -> S68Gradebook
          Positioned(
            left: 15.1,
            top: 1272.0,
            width: 359.9,
            height: 67.8,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s68_gradebook');
                },
              ),
            ),
          ),
          // Hotspot: Link - Assignments -> S66AssignmentQueue
          Positioned(
            left: 15.1,
            top: 1347.4,
            width: 359.9,
            height: 67.8,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s66_assignment_queue');
                },
              ),
            ),
          ),
          // Hotspot: Link - Transactions -> S93TransactionHistory
          Positioned(
            left: 15.1,
            top: 1422.8,
            width: 359.9,
            height: 67.8,
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
          // Hotspot: Link - Primary Edit Button -> S19EditProfile
          Positioned(
            left: 15.1,
            top: 1517.0,
            width: 359.9,
            height: 45.2,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s19_edit_profile');
                },
              ),
            ),
          ),
          // Hotspot: Button - Log Out Secondary Danger Action -> A01SharedSignIn
          Positioned(
            left: 15.1,
            top: 1569.7,
            width: 359.9,
            height: 45.2,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/a01_shared_sign_in');
                },
              ),
            ),
          ),
          // Hotspot: Background+Shadow -> GoBack
          Positioned(
            left: 15.1,
            top: 13.2,
            width: 33.9,
            height: 33.9,
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
          // Hotspot: GO:S10 / Home -> S10LearnerHome
          Positioned(
            left: 1.0,
            top: 1683.0,
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
            top: 1683.0,
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
            top: 1683.0,
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
            top: 1683.0,
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
        ],
      ),
    );
  }
}
