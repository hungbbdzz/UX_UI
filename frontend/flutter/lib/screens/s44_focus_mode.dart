import 'package:flutter/material.dart';
import '../widgets/figma_screen.dart';

/// Màn hình: S44 – Focus mode (Figma UI chuẩn xác cho người dùng)
/// Mã: S44 | Kích thước thiết kế: 390 x 1050 px
class S44FocusModeScreen extends StatelessWidget {
  const S44FocusModeScreen({super.key});

  static const routeName = '/s44_focus_mode';

  @override
  Widget build(BuildContext context) {
    return FigmaScreen(
      width: 390,
      height: 1050.00,
      background: const Color(0xFFF9F9FF),
      screenCode: 'S44',
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/S44FocusMode.png',
            width: 390.0,
            height: 1050.0,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
        ],
      ),
    );
  }
}
