import 'package:flutter/material.dart';
import '../widgets/figma_screen.dart';

/// Màn hình: S32 – Instructor profile (Figma UI chuẩn xác cho người dùng)
/// Mã: S32 | Kích thước thiết kế: 390 x 1654 px
class S32InstructorProfileScreen extends StatelessWidget {
  const S32InstructorProfileScreen({super.key});

  static const routeName = '/s32_instructor_profile';

  @override
  Widget build(BuildContext context) {
    return FigmaScreen(
      width: 390,
      height: 1654.00,
      background: const Color(0xFFF9F9FF),
      screenCode: 'S32',
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/S32InstructorProfile.png',
            width: 390.0,
            height: 1654.0,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
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
          // Hotspot: Text -> S30CourseDetails
          Positioned(
            left: 74.0,
            top: 938.4,
            width: 233.6,
            height: 40.0,
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
          // Hotspot: Direct Message Button -> S88Inbox
          Positioned(
            left: 197.5,
            top: 398.0,
            width: 156.0,
            height: 44.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s88_inbox');
                },
              ),
            ),
          ),
          // Hotspot: Button - Book 1-on-1 Mentorship (High Priority Tactical CTA) -> S85BookA1On1Mentor
          Positioned(
            left: 32.0,
            top: 450.0,
            width: 326.0,
            height: 48.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s85_book_a_1_on_1_mentor');
                },
              ),
            ),
          ),
          // Hotspot: Text -> S29SearchResults
          Positioned(
            left: 321.2,
            top: 1044.5,
            width: 48.8,
            height: 16.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s29_search_results');
                },
              ),
            ),
          ),
          // Hotspot: GO:S10 / Home -> S10LearnerHome
          Positioned(
            left: 1.0,
            top: 1597.0,
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
            top: 1597.0,
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
            top: 1597.0,
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
            top: 1597.0,
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
            top: 1597.0,
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
