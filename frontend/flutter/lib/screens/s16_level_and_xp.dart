import 'package:flutter/material.dart';
import '../widgets/figma_screen.dart';

/// Màn hình: S16 – Level and XP (Figma UI chuẩn xác cho người dùng)
/// Mã: S16 | Kích thước thiết kế: 390 x 1442 px
class S16LevelAndXpScreen extends StatelessWidget {
  const S16LevelAndXpScreen({super.key});

  static const routeName = '/s16_level_and_xp';

  @override
  Widget build(BuildContext context) {
    return FigmaScreen(
      width: 390,
      height: 1442.00,
      background: const Color(0xFFF9F9FF),
      screenCode: 'S16',
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/S16LevelAndXp.png',
            width: 390.0,
            height: 1442.0,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          // Hotspot: Complete a Lesson -> S36VideoPlayer
          Positioned(
            left: 32.0,
            top: 515.0,
            width: 147.0,
            height: 20.0,
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
          // Hotspot: Pass a Quiz -> S49MultipleChoiceQuiz
          Positioned(
            left: 211.0,
            top: 515.0,
            width: 112.0,
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
          // Hotspot: Daily Quest -> S17DailyQuests
          Positioned(
            left: 32.0,
            top: 637.0,
            width: 147.0,
            height: 20.0,
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
          // Hotspot: Review Decks -> S58Flashcard
          Positioned(
            left: 211.0,
            top: 637.0,
            width: 147.0,
            height: 20.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s58_flashcard');
                },
              ),
            ),
          ),
          // Hotspot: Milestone Rewards -> S15Badges
          Positioned(
            left: 16.0,
            top: 719.0,
            width: 358.0,
            height: 24.0,
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
          // Hotspot: Primary Sticky Bottom Action Bar → Button -> S70Leaderboard
          Positioned(
            left: 16.0,
            top: 1306.0,
            width: 358.0,
            height: 48.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s70_leaderboard');
                },
              ),
            ),
          ),
          // Hotspot: Button - Quay lại:margin -> GoBack
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
          // Hotspot: GO:S10 / Home -> S10LearnerHome
          Positioned(
            left: 1.0,
            top: 1385.0,
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
            top: 1385.0,
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
            top: 1385.0,
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
            top: 1385.0,
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
            top: 1385.0,
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
