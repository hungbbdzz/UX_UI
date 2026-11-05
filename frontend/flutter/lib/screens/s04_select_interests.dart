import 'package:flutter/material.dart';
import '../widgets/figma_screen.dart';

/// Màn hình: S04 – Select interests (Figma UI chuẩn xác cho người dùng)
/// Mã: S04 | Kích thước thiết kế: 390 x 999 px
class S04SelectInterestsScreen extends StatelessWidget {
  const S04SelectInterestsScreen({super.key});

  static const routeName = '/s04_select_interests';

  @override
  Widget build(BuildContext context) {
    return FigmaScreen(
      width: 390,
      height: 999.00,
      background: const Color(0xFFF9F9FF),
      screenCode: 'S04',
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/S04SelectInterests.png',
            width: 390.0,
            height: 999.0,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          // Hotspot: Button -> S05SelectCurrentLevel
          Positioned(
            left: 16.0,
            top: 890.2,
            width: 358.0,
            height: 54.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s05_select_current_level');
                },
              ),
            ),
          ),
          // Hotspot: Maybe later -> S10LearnerHome
          Positioned(
            left: 172.0,
            top: 956.2,
            width: 66.0,
            height: 14.0,
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
