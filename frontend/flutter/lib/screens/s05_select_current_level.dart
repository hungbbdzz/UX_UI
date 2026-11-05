import 'package:flutter/material.dart';
import '../widgets/figma_screen.dart';

/// Màn hình: S05 – Select current level (Figma UI chuẩn xác cho người dùng)
/// Mã: S05 | Kích thước thiết kế: 390 x 924 px
class S05SelectCurrentLevelScreen extends StatelessWidget {
  const S05SelectCurrentLevelScreen({super.key});

  static const routeName = '/s05_select_current_level';

  @override
  Widget build(BuildContext context) {
    return FigmaScreen(
      width: 390,
      height: 924.00,
      background: const Color(0xFFF9F9FF),
      screenCode: 'S05',
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/S05SelectCurrentLevel.png',
            width: 390.0,
            height: 924.0,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          // Hotspot: Button -> S06SetDailyStudyTime
          Positioned(
            left: 16.0,
            top: 851.2,
            width: 358.0,
            height: 48.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s06_set_daily_study_time');
                },
              ),
            ),
          ),
          // Hotspot: Maybe later -> S10LearnerHome
          Positioned(
            left: 214.0,
            top: 864.2,
            width: 72.0,
            height: 22.0,
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
