import 'package:flutter/material.dart';
import '../widgets/figma_screen.dart';

/// Màn hình: S08 – Placement results (Figma UI chuẩn xác cho người dùng)
/// Mã: S08 | Kích thước thiết kế: 390 x 1204 px
class S08PlacementResultsScreen extends StatelessWidget {
  const S08PlacementResultsScreen({super.key});

  static const routeName = '/s08_placement_results';

  @override
  Widget build(BuildContext context) {
    return FigmaScreen(
      width: 390,
      height: 1204.00,
      background: const Color(0xFFF9F9FF),
      screenCode: 'S08',
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/S08PlacementResults.png',
            width: 390.0,
            height: 1204.0,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          // Hotspot: Primary CTA Button -> S09SuggestedLearningPath
          Positioned(
            left: 16.0,
            top: 1072.0,
            width: 358.0,
            height: 48.0,
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
          // Hotspot: Secondary Ghost Button -> S07PlacementTestAssessment
          Positioned(
            left: 16.0,
            top: 1132.0,
            width: 358.0,
            height: 40.0,
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
