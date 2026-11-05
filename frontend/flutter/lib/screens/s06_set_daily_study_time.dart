import 'package:flutter/material.dart';
import '../widgets/figma_screen.dart';

/// Màn hình: S06 – Set daily study time (Figma UI chuẩn xác cho người dùng)
/// Mã: S06 | Kích thước thiết kế: 390 x 1134 px
class S06SetDailyStudyTimeScreen extends StatelessWidget {
  const S06SetDailyStudyTimeScreen({super.key});

  static const routeName = '/s06_set_daily_study_time';

  @override
  Widget build(BuildContext context) {
    return FigmaScreen(
      width: 390,
      height: 1134.00,
      background: const Color(0xFFF9F9FF),
      screenCode: 'S06',
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/S06SetDailyStudyTime.png',
            width: 390.0,
            height: 1134.0,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          // Hotspot: 20:00 (8:00 PM) -> S23StudyReminders
          Positioned(
            left: 84.0,
            top: 896.4,
            width: 103.0,
            height: 18.0,
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
          // Hotspot: Button - Primary Action CTA -> S09SuggestedLearningPath
          Positioned(
            left: 16.0,
            top: 963.4,
            width: 358.0,
            height: 50.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s09_suggested_learning_path');
                },
              ),
            ),
          ),
          // Hotspot: Button - Secondary Ghost / Skip Action -> S10LearnerHome
          Positioned(
            left: 16.0,
            top: 1025.4,
            width: 358.0,
            height: 44.0,
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
          // Hotspot: Take placement test -> S07PlacementTestAssessment
          Positioned(
            left: 16.0,
            top: 1081.4,
            width: 137.0,
            height: 20.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s07_placement_test_assessment');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
