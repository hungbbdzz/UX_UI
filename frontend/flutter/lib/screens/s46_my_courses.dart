import 'package:flutter/material.dart';
import '../widgets/figma_screen.dart';

/// Màn hình: S46 – My courses (Figma UI chuẩn xác cho người dùng)
/// Mã: S46 | Kích thước thiết kế: 390 x 1255 px
class S46MyCoursesScreen extends StatelessWidget {
  const S46MyCoursesScreen({super.key});

  static const routeName = '/s46_my_courses';

  @override
  Widget build(BuildContext context) {
    return FigmaScreen(
      width: 390,
      height: 1255.00,
      background: const Color(0xFFF9F9FF),
      screenCode: 'S46',
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/S46MyCourses.png',
            width: 390.0,
            height: 1255.0,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          // Hotspot: Practical Python for Data Analysis & Automation -> S47CourseProgressDetails
          Positioned(
            left: 104.0,
            top: 313.0,
            width: 254.0,
            height: 44.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s47_course_progress_details');
                },
              ),
            ),
          ),
          // Hotspot: Button -> S36VideoPlayer
          Positioned(
            left: 32.0,
            top: 509.0,
            width: 270.0,
            height: 48.0,
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
          // Hotspot: English for Tech Careers: Interviews & Presentations -> S47CourseProgressDetails
          Positioned(
            left: 104.0,
            top: 621.0,
            width: 254.0,
            height: 44.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s47_course_progress_details');
                },
              ),
            ),
          ),
          // Hotspot: Button -> S37AudioLesson
          Positioned(
            left: 32.0,
            top: 799.0,
            width: 326.0,
            height: 44.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s37_audio_lesson');
                },
              ),
            ),
          ),
          // Hotspot: Data Engineering Essentials: Stream Mappers -> S47CourseProgressDetails
          Positioned(
            left: 104.0,
            top: 907.0,
            width: 254.0,
            height: 44.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s47_course_progress_details');
                },
              ),
            ),
          ),
          // Hotspot: Button -> S38ReadingLesson
          Positioned(
            left: 32.0,
            top: 1085.0,
            width: 326.0,
            height: 44.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s38_reading_lesson');
                },
              ),
            ),
          ),
          // Hotspot: GO:S10 / Home -> S10LearnerHome
          Positioned(
            left: 1.0,
            top: 1198.0,
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
            top: 1198.0,
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
          // Hotspot: GO:S79 / Community -> S79Forum
          Positioned(
            left: 233.8,
            top: 1198.0,
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
            top: 1198.0,
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
