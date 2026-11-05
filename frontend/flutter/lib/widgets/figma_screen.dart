import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const bool _showDebugNav = bool.fromEnvironment('SHOW_DEBUG_NAV', defaultValue: false);

/// Renders a fixed Figma frame (390 logical px wide) and scales it to the
/// available width while keeping every spacing, font and asset proportional.
/// Includes pinned 5-tab Bottom Navigation Bar and Safe Area padding.
class FigmaScreen extends StatelessWidget {
  const FigmaScreen({
    super.key,
    required this.width,
    required this.height,
    required this.child,
    this.background = const Color(0xFFFFFFFF),
    this.screenCode,
    this.previousRoute,
    this.nextRoute,
    this.showBottomNav,
  });

  final double width;
  final double height;
  final Widget child;
  final Color background;
  final String? screenCode;
  final String? previousRoute;
  final String? nextRoute;
  final bool? showBottomNav;

  bool get _hasBottomNav {
    if (showBottomNav != null) return showBottomNav!;
    if (screenCode == null) return false;
    final code = screenCode!.toUpperCase();
    if (code.startsWith('A') ||
        code == 'S01' || code == 'S02' || code == 'S03' ||
        code == 'S04' || code == 'S05' || code == 'S06' ||
        code == 'S07' || code == 'S08' || code == 'S09' ||
        code == 'S36' || code == 'S37' || code == 'S44') {
      return false;
    }
    return true;
  }

  String get _activeTab {
    final code = (screenCode ?? '').toUpperCase();
    final m = RegExp(r'S(\d+)').firstMatch(code);
    final num = m != null ? int.tryParse(m.group(1)!) ?? 0 : 0;
    if ((num >= 10 && num <= 17) || num == 20 || num == 21) return 'home';
    if (num >= 25 && num <= 35) return 'explore';
    if ((num >= 38 && num <= 43) || (num >= 45 && num <= 72)) return 'courses';
    if (num >= 73 && num <= 85) return 'community';
    if (num == 18 || num == 19 || (num >= 22 && num <= 24) || (num >= 86 && num <= 96)) return 'profile';
    return 'home';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      bottomNavigationBar: _hasBottomNav ? FigmaBottomNav(activeTab: _activeTab) : null,
      body: SafeArea(
        top: true,
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final canvasWidth = constraints.maxWidth > 460 ? 430.0 : constraints.maxWidth;
            final scale = canvasWidth / width;
            // Nếu màn hình có Bottom Nav cố định (FigmaBottomNav), cắt bỏ 64px tĩnh ở đáy ảnh Figma
            // để triệt tiêu hoàn toàn thanh nav thứ 2 (chống Tôn hành giả - Giả hành tôn)
            final displayHeight = _hasBottomNav ? (height - 64.0) : height;
            final scaledHeight = displayHeight * scale;
            final viewportHeight = constraints.maxHeight;
            final canScroll = scaledHeight > (viewportHeight + 2);
            final stackHeight =
                scaledHeight < viewportHeight ? viewportHeight : scaledHeight;

            return SingleChildScrollView(
              physics: canScroll
                  ? const ClampingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              child: Center(
                child: SizedBox(
                  width: canvasWidth,
                  height: stackHeight,
                  child: ClipRect(
                    child: Stack(
                      clipBehavior: Clip.hardEdge,
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          width: canvasWidth,
                          height: height * scale,
                          child: Transform.scale(
                            scale: scale,
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              width: width,
                              height: height,
                              child: child,
                            ),
                          ),
                        ),
                        if (_showDebugNav && kDebugMode)
                          Positioned(
                            right: 12,
                            bottom: 12,
                            child: _DebugNav(
                              screenCode: screenCode,
                              previousRoute: previousRoute,
                              nextRoute: nextRoute,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Pinned 5-tab Bottom Navigation Bar synchronized with Figma High-Fidelity
class FigmaBottomNav extends StatelessWidget {
  const FigmaBottomNav({super.key, required this.activeTab});

  final String activeTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.96),
        border: Border(
          top: BorderSide(
            color: const Color(0xFFE2E8F0).withValues(alpha: 0.9),
            width: 1.0,
          ),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            offset: Offset(0, -4),
            blurRadius: 16,
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.only(top: 6, bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(
                id: 'home',
                label: 'Home',
                icon: Icons.home_rounded,
                isActive: activeTab == 'home',
                targetRoute: '/s10_learner_home',
              ),
              _NavItem(
                id: 'explore',
                label: 'Explore',
                icon: Icons.explore_rounded,
                isActive: activeTab == 'explore',
                targetRoute: '/s25_explore',
              ),
              _NavItem(
                id: 'courses',
                label: 'Courses',
                icon: Icons.menu_book_rounded,
                isActive: activeTab == 'courses',
                targetRoute: '/s46_my_courses',
              ),
              _NavItem(
                id: 'community',
                label: 'Community',
                icon: Icons.groups_rounded,
                isActive: activeTab == 'community',
                targetRoute: '/s79_community_forum',
              ),
              _NavItem(
                id: 'profile',
                label: 'Profile',
                icon: Icons.person_rounded,
                isActive: activeTab == 'profile',
                targetRoute: '/s18_personal_profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.id,
    required this.label,
    required this.icon,
    required this.isActive,
    required this.targetRoute,
  });

  final String id;
  final String label;
  final IconData icon;
  final bool isActive;
  final String targetRoute;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF2A14B4);
    const inactiveColor = Color(0xFF64748B);

    return InkWell(
      onTap: () {
        if (!isActive) {
          Navigator.of(context).pushReplacementNamed(targetRoute);
        }
      },
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
              decoration: BoxDecoration(
                color: isActive ? const Color(0xFFEDE9FE) : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icon,
                size: 22,
                color: isActive ? primaryColor : inactiveColor,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                color: isActive ? primaryColor : inactiveColor,
                letterSpacing: -0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DebugNav extends StatelessWidget {
  const _DebugNav({
    this.screenCode,
    this.previousRoute,
    this.nextRoute,
  });

  final String? screenCode;
  final String? previousRoute;
  final String? nextRoute;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withValues(alpha: 0.72),
      borderRadius: BorderRadius.circular(999),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _DebugButton(
              icon: Icons.chevron_left,
              onTap: previousRoute == null
                  ? null
                  : () => Navigator.of(context)
                      .pushReplacementNamed(previousRoute!),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                screenCode ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            _DebugButton(
              icon: Icons.chevron_right,
              onTap: nextRoute == null
                  ? null
                  : () => Navigator.of(context).pushReplacementNamed(nextRoute!),
            ),
          ],
        ),
      ),
    );
  }
}

class _DebugButton extends StatelessWidget {
  const _DebugButton({required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Icon(
          icon,
          color: onTap == null ? Colors.white24 : Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
