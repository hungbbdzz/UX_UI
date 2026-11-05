import 'package:flutter/material.dart';
import '../widgets/figma_screen.dart';

/// Màn hình: S25 – Explore (Figma UI chuẩn xác cho người dùng)
/// Mã: S25 | Kích thước thiết kế: 390 x 2172 px
class S25ExploreScreen extends StatelessWidget {
  const S25ExploreScreen({super.key});

  static const routeName = '/s25_explore';

  @override
  Widget build(BuildContext context) {
    return FigmaScreen(
      width: 390,
      height: 2172.00,
      background: const Color(0xFFF9F9FF),
      screenCode: 'S25',
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/S25Explore.png',
            width: 390.0,
            height: 2172.0,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          // Hotspot: Background -> GoBack
          Positioned(
            left: 16.0,
            top: 12.0,
            width: 40.0,
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
          // Hotspot: Link - See All Categories leading pill -> S26CourseCategories
          Positioned(
            left: 16.0,
            top: 168.0,
            width: 125.5,
            height: 32.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s26_course_categories');
                },
              ),
            ),
          ),
          // Hotspot: Button - Category Chips -> S29SearchResults
          Positioned(
            left: 154.8,
            top: 168.0,
            width: 126.8,
            height: 32.0,
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
          // Hotspot: Button -> S29SearchResults
          Positioned(
            left: 287.2,
            top: 168.0,
            width: 112.1,
            height: 32.0,
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
          // Hotspot: Text -> S30CourseDetails
          Positioned(
            left: 32.0,
            top: 407.1,
            width: 224.4,
            height: 39.0,
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
          // Hotspot: English Conversation A2 -> S30CourseDetails
          Positioned(
            left: 308.0,
            top: 416.1,
            width: 170.4,
            height: 20.0,
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
          // Hotspot: English for Tech Careers: Interviews &… -> S30CourseDetails
          Positioned(
            left: 32.0,
            top: 940.5,
            width: 270.0,
            height: 20.0,
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
          // Hotspot: Link → View all -> S32InstructorProfile
          Positioned(
            left: 326.4,
            top: 1253.5,
            width: 47.6,
            height: 16.0,
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
          // Hotspot: Button -> S27Search
          Positioned(
            left: 16.0,
            top: 84.0,
            width: 358.0,
            height: 52.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s27_search');
                },
              ),
            ),
          ),
          // Hotspot: GO:S10 / Home -> S10LearnerHome
          Positioned(
            left: 1.0,
            top: 2115.0,
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
          // Hotspot: GO:S46 / Courses -> S46MyCourses
          Positioned(
            left: 156.2,
            top: 2115.0,
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
            top: 2115.0,
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
            top: 2115.0,
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
