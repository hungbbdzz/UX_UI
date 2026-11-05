import 'package:flutter/material.dart';
import '../widgets/figma_screen.dart';

/// Màn hình: S07 – Placement Test Assessment (Figma UI chuẩn xác cho người dùng)
/// Mã: S07 | Kích thước thiết kế: 390 x 844 px
class S07PlacementTestAssessmentScreen extends StatelessWidget {
  const S07PlacementTestAssessmentScreen({super.key});

  static const routeName = '/s07_placement_test_assessment';

  @override
  Widget build(BuildContext context) {
    return FigmaScreen(
      width: 390,
      height: 844.00,
      background: const Color(0xFFF9F9FF),
      screenCode: 'S07',
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/S07PlacementTestAssessment.png',
            width: 390.0,
            height: 844.0,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          // Hotspot: Button -> S09SuggestedLearningPath
          Positioned(
            left: 187.0,
            top: 18.0,
            width: 187.0,
            height: 16.0,
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
          // Hotspot: Button -> S08PlacementResults
          Positioned(
            left: 106.5,
            top: 700.0,
            width: 267.5,
            height: 48.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s08_placement_results');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
