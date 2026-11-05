import 'package:flutter/material.dart';
import '../widgets/figma_screen.dart';

/// Màn hình: S31 – Syllabus (Figma UI chuẩn xác cho người dùng)
/// Mã: S31 | Kích thước thiết kế: 390 x 1612 px
class S31SyllabusScreen extends StatelessWidget {
  const S31SyllabusScreen({super.key});

  static const routeName = '/s31_syllabus';

  @override
  Widget build(BuildContext context) {
    return FigmaScreen(
      width: 390,
      height: 1612.00,
      background: const Color(0xFFF9F9FF),
      screenCode: 'S31',
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/S31Syllabus.png',
            width: 390.0,
            height: 1612.0,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          // Hotspot: Link - Lesson 1.1 -> S36VideoPlayer
          Positioned(
            left: 32.0,
            top: 358.0,
            width: 326.0,
            height: 60.0,
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
          // Hotspot: Link - Lesson 1.2 -> S37AudioLesson
          Positioned(
            left: 32.0,
            top: 422.0,
            width: 326.0,
            height: 60.0,
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
          // Hotspot: Link - Lesson 1.3 -> S38ReadingLesson
          Positioned(
            left: 32.0,
            top: 486.0,
            width: 326.0,
            height: 60.0,
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
          // Hotspot: Link - Lesson 1.4 -> S39XemSlide
          Positioned(
            left: 32.0,
            top: 550.0,
            width: 326.0,
            height: 60.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s39_xem_slide');
                },
              ),
            ),
          ),
          // Hotspot: Link - Lesson 1.5 -> S49MultipleChoiceQuiz
          Positioned(
            left: 32.0,
            top: 614.0,
            width: 326.0,
            height: 60.0,
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
          // Hotspot: Link - Lesson 2.1 -> S36VideoPlayer
          Positioned(
            left: 32.0,
            top: 776.0,
            width: 326.0,
            height: 60.0,
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
          // Hotspot: Lesson 2.2 -> S37AudioLesson
          Positioned(
            left: 32.0,
            top: 840.0,
            width: 326.0,
            height: 60.0,
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
          // Hotspot: Lesson 2.3 -> S38ReadingLesson
          Positioned(
            left: 32.0,
            top: 904.0,
            width: 326.0,
            height: 60.0,
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
          // Hotspot: Lesson 2.4 -> S65SubmitAssignment
          Positioned(
            left: 32.0,
            top: 968.0,
            width: 326.0,
            height: 60.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s65_submit_assignment');
                },
              ),
            ),
          ),
          // Hotspot: Lesson 2.5 -> S49MultipleChoiceQuiz
          Positioned(
            left: 32.0,
            top: 1032.0,
            width: 326.0,
            height: 60.0,
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
          // Hotspot: Link -> S30CourseDetails
          Positioned(
            left: 252.0,
            top: 1488.0,
            width: 146.0,
            height: 48.0,
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
          // Hotspot: Button - Go back -> GoBack
          Positioned(
            left: 16.0,
            top: 10.0,
            width: 44.0,
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
          // Hotspot: GO:S10 / Home -> S10LearnerHome
          Positioned(
            left: 1.0,
            top: 1555.0,
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
            top: 1555.0,
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
            top: 1555.0,
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
            top: 1555.0,
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
            top: 1555.0,
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
