import 'package:flutter/material.dart';
import '../widgets/figma_screen.dart';

/// Màn hình: S37 – Audio lesson (Figma UI chuẩn xác cho người dùng)
/// Mã: S37 | Kích thước thiết kế: 390 x 1300 px
class S37AudioLessonScreen extends StatelessWidget {
  const S37AudioLessonScreen({super.key});

  static const routeName = '/s37_audio_lesson';

  @override
  Widget build(BuildContext context) {
    return FigmaScreen(
      width: 390,
      height: 1300.00,
      background: const Color(0xFFF9F9FF),
      screenCode: 'S37',
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/S37AudioLesson.png',
            width: 390.0,
            height: 1300.0,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          // Hotspot: Button - Go back:margin -> GoBack
          Positioned(
            left: 16.0,
            top: 10.0,
            width: 36.0,
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
          // Hotspot: Text -> S31Syllabus
          Positioned(
            left: 36.8,
            top: 89.0,
            width: 101.5,
            height: 16.0,
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
          // Hotspot: Button -> S36VideoPlayer
          Positioned(
            left: 245.2,
            top: 84.0,
            width: 128.8,
            height: 26.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s36_video_player');
                },
              ),
            ),
          ),
          // Hotspot: Button -> S41DictionaryLookup
          Positioned(
            left: 34.0,
            top: 899.5,
            width: 142.0,
            height: 23.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s41_dictionary_lookup');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
