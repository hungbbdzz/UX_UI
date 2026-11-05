import 'package:flutter/material.dart';
import '../widgets/figma_screen.dart';

/// Màn hình: S03 – Select learning goal (Figma UI chuẩn xác cho người dùng)
/// Mã: S03 | Kích thước thiết kế: 390 x 967 px
class S03SelectLearningGoalScreen extends StatelessWidget {
  const S03SelectLearningGoalScreen({super.key});

  static const routeName = '/s03_select_learning_goal';

  @override
  Widget build(BuildContext context) {
    return FigmaScreen(
      width: 390,
      height: 967.00,
      background: const Color(0xFFF9F9FF),
      screenCode: 'S03',
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/S03SelectLearningGoal.png',
            width: 390.0,
            height: 967.0,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          // Hotspot: Button -> S04SelectInterests
          Positioned(
            left: 16.0,
            top: 883.0,
            width: 358.0,
            height: 48.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s04_select_interests');
                },
              ),
            ),
          ),
          // Hotspot: Maybe later -> S10LearnerHome
          Positioned(
            left: 170.0,
            top: 939.0,
            width: 63.0,
            height: 12.0,
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
        ],
      ),
    );
  }
}
