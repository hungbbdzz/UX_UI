import 'package:flutter/material.dart';
import '../widgets/figma_screen.dart';

/// Màn hình: S27 – Search (Figma UI chuẩn xác cho người dùng)
/// Mã: S27 | Kích thước thiết kế: 390 x 1188 px
class S27SearchScreen extends StatelessWidget {
  const S27SearchScreen({super.key});

  static const routeName = '/s27_search';

  @override
  Widget build(BuildContext context) {
    return FigmaScreen(
      width: 390,
      height: 1188.00,
      background: const Color(0xFFF9F9FF),
      screenCode: 'S27',
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/S27Search.png',
            width: 390.0,
            height: 1188.0,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          // Hotspot: Button - Go back -> GoBack
          Positioned(
            left: 8.0,
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
          // Hotspot: Text -> S29SearchResults
          Positioned(
            left: 56.0,
            top: 20.0,
            width: 188.2,
            height: 24.0,
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
          // Hotspot: Button - Open Filters -> S28AdvancedFilters
          Positioned(
            left: 326.0,
            top: 82.0,
            width: 48.0,
            height: 48.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s28_advanced_filters');
                },
              ),
            ),
          ),
          // Hotspot: Link - Suggestion 1 -> S29SearchResults
          Positioned(
            left: 32.0,
            top: 240.0,
            width: 326.0,
            height: 52.0,
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
          // Hotspot: Link - Suggestion 2 -> S29SearchResults
          Positioned(
            left: 32.0,
            top: 292.0,
            width: 326.0,
            height: 52.0,
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
          // Hotspot: Link - Suggestion 3 -> S29SearchResults
          Positioned(
            left: 32.0,
            top: 344.0,
            width: 326.0,
            height: 52.0,
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
          // Hotspot: Section - Recent Search History -> S29SearchResults
          Positioned(
            left: 16.0,
            top: 500.0,
            width: 358.0,
            height: 138.0,
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
          // Hotspot: Link:margin -> S29SearchResults
          Positioned(
            left: 28.0,
            top: 538.0,
            width: 155.5,
            height: 18.0,
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
          // Hotspot: Link - Item 1 - Featured #1 -> S29SearchResults
          Positioned(
            left: 16.0,
            top: 688.0,
            width: 358.0,
            height: 76.0,
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
          // Hotspot: Link - Item 2 -> S29SearchResults
          Positioned(
            left: 16.0,
            top: 774.0,
            width: 358.0,
            height: 74.0,
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
          // Hotspot: Link - Item 3 -> S29SearchResults
          Positioned(
            left: 16.0,
            top: 858.0,
            width: 358.0,
            height: 74.0,
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
          // Hotspot: Link - Item 4 -> S29SearchResults
          Positioned(
            left: 16.0,
            top: 942.0,
            width: 358.0,
            height: 74.0,
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
          // Hotspot: Link - Item 5 -> S29SearchResults
          Positioned(
            left: 16.0,
            top: 1026.0,
            width: 358.0,
            height: 74.0,
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
            top: 1131.0,
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
            top: 1131.0,
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
            top: 1131.0,
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
            top: 1131.0,
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
            top: 1131.0,
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
