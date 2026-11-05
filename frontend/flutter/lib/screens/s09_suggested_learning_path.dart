import 'package:flutter/material.dart';
import '../widgets/figma_screen.dart';

/// Màn hình: S09 – Suggested learning path (Figma UI chuẩn xác cho người dùng)
/// Mã: S09 | Kích thước thiết kế: 390 x 1003 px
class S09SuggestedLearningPathScreen extends StatelessWidget {
  const S09SuggestedLearningPathScreen({super.key});

  static const routeName = '/s09_suggested_learning_path';

  @override
  Widget build(BuildContext context) {
    return FigmaScreen(
      width: 390,
      height: 1003.00,
      background: const Color(0xFFF9F9FF),
      screenCode: 'S09',
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/S09SuggestedLearningPath.png',
            width: 390.0,
            height: 1003.0,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          // Hotspot: Python Foundations & Syntax -> S30CourseDetails
          Positioned(
            left: 73.7,
            top: 324.2,
            width: 302.6,
            height: 19.0,
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
          // Hotspot: Data Structures & Functions -> S30CourseDetails
          Positioned(
            left: 73.7,
            top: 524.6,
            width: 233.1,
            height: 19.0,
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
          // Hotspot: Object-Oriented Programming (OOP) -> S30CourseDetails
          Positioned(
            left: 73.7,
            top: 663.6,
            width: 233.1,
            height: 38.0,
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
          // Hotspot: Applied Mini-Projects & Capstone -> S30CourseDetails
          Positioned(
            left: 73.7,
            top: 821.6,
            width: 233.1,
            height: 19.0,
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
          // Hotspot: Button -> S10LearnerHome
          Positioned(
            left: 13.7,
            top: 929.0,
            width: 306.7,
            height: 41.1,
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
