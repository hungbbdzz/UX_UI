import 'package:flutter/material.dart';
import '../widgets/figma_screen.dart';

/// Màn hình: S30 – Course details (Figma UI chuẩn xác cho người dùng)
/// Mã: S30 | Kích thước thiết kế: 390 x 1681 px
class S30CourseDetailsScreen extends StatelessWidget {
  const S30CourseDetailsScreen({super.key});

  static const routeName = '/s30_course_details';

  @override
  Widget build(BuildContext context) {
    return FigmaScreen(
      width: 390,
      height: 1681.00,
      background: const Color(0xFFF9F9FF),
      screenCode: 'S30',
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/S30CourseDetails.png',
            width: 390.0,
            height: 1681.0,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          // Hotspot: Link -> S45ChooseCohortSchedule
          Positioned(
            left: 32.0,
            top: 1476.4,
            width: 326.0,
            height: 24.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s45_choose_cohort_schedule');
                },
              ),
            ),
          ),
          // Hotspot: Link - Center Play Button linking to S35 -> S35LessonPreview
          Positioned(
            left: 16.0,
            top: 128.0,
            width: 358.0,
            height: 201.4,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s35_lesson_preview');
                },
              ),
            ),
          ),
          // Hotspot: Link - Instructor Info Card (Navigates to S32) -> S32InstructorProfile
          Positioned(
            left: 16.0,
            top: 482.4,
            width: 358.0,
            height: 80.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s32_instructor_profile');
                },
              ),
            ),
          ),
          // Hotspot: Link -> S31Syllabus
          Positioned(
            left: 136.7,
            top: 642.4,
            width: 116.7,
            height: 36.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s31_syllabus');
                },
              ),
            ),
          ),
          // Hotspot: Link -> S33CourseReviews
          Positioned(
            left: 253.3,
            top: 642.4,
            width: 116.7,
            height: 36.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s33_course_reviews');
                },
              ),
            ),
          ),
          // Hotspot: Link -> S35LessonPreview
          Positioned(
            left: 138.0,
            top: 1549.0,
            width: 79.0,
            height: 44.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s35_lesson_preview');
                },
              ),
            ),
          ),
          // Hotspot: Link -> S89CourseCheckout
          Positioned(
            left: 221.0,
            top: 1549.0,
            width: 153.0,
            height: 44.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s89_course_checkout');
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
            top: 1624.0,
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
            top: 1624.0,
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
            top: 1624.0,
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
            top: 1624.0,
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
            top: 1624.0,
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
