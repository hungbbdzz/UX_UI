import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const bool _showDebugNav = bool.fromEnvironment('SHOW_DEBUG_NAV', defaultValue: false);

/// Renders a fixed Figma frame (390 logical px wide) and scales it to the
/// available width while keeping every spacing, font and asset proportional.
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
  });

  final double width;
  final double height;
  final Widget child;
  final Color background;
  final String? screenCode;
  final String? previousRoute;
  final String? nextRoute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final canvasWidth = constraints.maxWidth > 460 ? 430.0 : constraints.maxWidth;
          final scale = canvasWidth / width;
          final scaledHeight = height * scale;
          final viewportHeight = constraints.maxHeight;
          final stackHeight =
              scaledHeight < viewportHeight ? viewportHeight : scaledHeight;

          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Center(
              child: SizedBox(
                width: canvasWidth,
                height: stackHeight,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      width: canvasWidth,
                      height: scaledHeight,
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
          );
        },
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
