import 'package:flutter/material.dart';
import '../widgets/figma_screen.dart';

/// Màn hình: S01 – Splash (Figma UI chuẩn xác cho người dùng)
/// Mã: S01 | Kích thước thiết kế: 390 x 844 px
class S01SplashScreen extends StatelessWidget {
  const S01SplashScreen({super.key});

  static const routeName = '/s01_splash';

  @override
  Widget build(BuildContext context) {
    return FigmaScreen(
      width: 390,
      height: 844.00,
      background: const Color(0xFF3626BF),
      screenCode: 'S01',
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.pushNamed(context, '/s02_feature_introduction'),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              'assets/images/S01Splash.png',
              width: 390.0,
              height: 844.0,
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high,
            ),
          // Hotspot: S01 – Splash -> S02FeatureIntroduction
          Positioned(
            left: 0.0,
            top: 0.0,
            width: 390.0,
            height: 844.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s02_feature_introduction');
                },
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}
