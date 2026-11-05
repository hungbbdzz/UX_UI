import 'package:flutter/material.dart';
import '../widgets/figma_screen.dart';

/// Màn hình: S36 – Video player (Figma UI chuẩn xác cho người dùng)
/// Mã: S36 | Kích thước thiết kế: 390 x 1320 px
class S36VideoPlayerScreen extends StatelessWidget {
  const S36VideoPlayerScreen({super.key});

  static const routeName = '/s36_video_player';

  @override
  Widget build(BuildContext context) {
    return FigmaScreen(
      width: 390,
      height: 1320.00,
      background: const Color(0xFFF9F9FF),
      screenCode: 'S36',
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/S36VideoPlayer.png',
            width: 390.0,
            height: 1320.0,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          // Hotspot: Button - Go back:margin -> GoBack
          Positioned(
            left: 16.0,
            top: 10.0,
            width: 38.0,
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
          // Hotspot: Button - Look up definition for lambda function -> S41DictionaryLookup
          Positioned(
            left: 189.1,
            top: 417.4,
            width: 143.5,
            height: 24.0,
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
          // Hotspot: 1. Take Note Button -> S40TimestampedVideoNotes
          Positioned(
            left: 16.0,
            top: 524.0,
            width: 70.1,
            height: 96.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s40_timestamped_video_notes');
                },
              ),
            ),
          ),
          // Hotspot: 2. Playlist / Syllabus Drawer Button -> S43LessonPlaylist
          Positioned(
            left: 94.1,
            top: 524.0,
            width: 83.5,
            height: 96.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s43_lesson_playlist');
                },
              ),
            ),
          ),
          // Hotspot: 3. Offline Download Button -> S42ManageOfflineDownloads
          Positioned(
            left: 185.6,
            top: 524.0,
            width: 83.5,
            height: 96.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s42_manage_offline_downloads');
                },
              ),
            ),
          ),
          // Hotspot: Button -> S40TimestampedVideoNotes
          Positioned(
            left: 20.0,
            top: 768.0,
            width: 84.5,
            height: 32.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s40_timestamped_video_notes');
                },
              ),
            ),
          ),
          // Hotspot: Button -> S80DiscussionThread
          Positioned(
            left: 108.5,
            top: 768.0,
            width: 84.5,
            height: 32.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s80_discussion_thread');
                },
              ),
            ),
          ),
          // Hotspot: Tab Dynamic Content Slot → Notes Content (Default active) -> S40TimestampedVideoNotes
          Positioned(
            left: 16.0,
            top: 820.0,
            width: 358.0,
            height: 296.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s40_timestamped_video_notes');
                },
              ),
            ),
          ),
          // Hotspot: Link - Tactile Up Next Card -> S49MultipleChoiceQuiz
          Positioned(
            left: 16.0,
            top: 1166.0,
            width: 358.0,
            height: 86.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s49_multiple_choice_quiz');
                },
              ),
            ),
          ),
          // Hotspot: Next lesson in the syllabus -> S43LessonPlaylist
          Positioned(
            left: 60.0,
            top: 353.4,
            width: 159.0,
            height: 18.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s43_lesson_playlist');
                },
              ),
            ),
          ),
          // Hotspot: Link -> S49MultipleChoiceQuiz
          Positioned(
            left: 272.0,
            top: 325.4,
            width: 102.0,
            height: 36.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s49_multiple_choice_quiz');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
