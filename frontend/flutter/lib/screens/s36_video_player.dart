import 'package:flutter/material.dart';

/// Màn hình: S36 – Video player
/// Figma Frame ID: 21:10957 | Nhóm: Part B · Member 2 — Course discovery and learning content (S25–S48)
class S36VideoPlayerScreen extends StatelessWidget {
  const S36VideoPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),
      appBar: AppBar(
        title: Text(
          'S36 – Video player',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Color(0xFF151C27)),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: Color(0xFF151C27)),
                onPressed: () => Navigator.pop(context),
              )
            : null,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE2E8F8)),
                boxShadow: const [
                  BoxShadow(color: Color(0x06000000), blurRadius: 10, offset: Offset(0, 4))
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2A14B4).withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'Part B · Member 2',
                          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF2A14B4)),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '390 x 1320 px',
                        style: const TextStyle(fontSize: 12, color: Color(0xFF777586), fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'S36 – Video player',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF151C27)),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Trích xuất tự động từ Figma REST API với đầy đủ Prototype links chính xác.',
                    style: TextStyle(fontSize: 13, color: Color(0xFF464554), height: 1.4),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.touch_app_rounded, size: 18, color: Color(0xFF2A14B4)),
                const SizedBox(width: 8),
                Text(
                  'Các liên kết Prototype từ Figma (11):',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF2A14B4)),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Tương tác Prototype: ON_CLICK -> Quay lại màn hình trước
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF464554),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_rounded, size: 18),
                label: Text(
                  'Button - Go back:margin → Quay lại màn hình trước',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S41 – Dictionary lookup
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFD761A),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => Navigator.pushNamed(context, '/s41dictionarylookup'),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(
                  'Button - Look up definition for lambd... → S41 – Dictionary lookup',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S40 – Timestamped video notes
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFD761A),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => Navigator.pushNamed(context, '/s40timestampedvideonotes'),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(
                  '1. Take Note Button → S40 – Timestamped video notes',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S43 – Lesson playlist
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFD761A),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => Navigator.pushNamed(context, '/s43lessonplaylist'),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(
                  '2. Playlist / Syllabus Drawer Button → S43 – Lesson playlist',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S42 – Manage offline downloads
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFD761A),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => Navigator.pushNamed(context, '/s42manageofflinedownloads'),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(
                  '3. Offline Download Button → S42 – Manage offline downloads',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S40 – Timestamped video notes
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFD761A),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => Navigator.pushNamed(context, '/s40timestampedvideonotes'),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(
                  'Button → S40 – Timestamped video notes',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S80 – Discussion thread
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2A14B4),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Liên kết chuyển tiếp sang S80 – Discussion thread (Part D · Member 4 — Live classes, community and payments (S73–S96))')),
                ),
                icon: const Icon(Icons.open_in_new_rounded, size: 18),
                label: Text(
                  'Button → S80 – Discussion thread',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S40 – Timestamped video notes
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFD761A),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => Navigator.pushNamed(context, '/s40timestampedvideonotes'),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(
                  'Tab Dynamic Content Slot → Notes Cont... → S40 – Timestamped video notes',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S49 – Multiple-choice quiz
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2A14B4),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Liên kết chuyển tiếp sang S49 – Multiple-choice quiz (Part C · Member 3 — Practice, assessments, grades and challenges (S49–S72))')),
                ),
                icon: const Icon(Icons.open_in_new_rounded, size: 18),
                label: Text(
                  'Link - Tactile Up Next Card → S49 – Multiple-choice quiz',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S43 – Lesson playlist
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFD761A),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => Navigator.pushNamed(context, '/s43lessonplaylist'),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(
                  'Next lesson in the syllabus → S43 – Lesson playlist',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S49 – Multiple-choice quiz
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2A14B4),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Liên kết chuyển tiếp sang S49 – Multiple-choice quiz (Part C · Member 3 — Practice, assessments, grades and challenges (S49–S72))')),
                ),
                icon: const Icon(Icons.open_in_new_rounded, size: 18),
                label: Text(
                  'Link → S49 – Multiple-choice quiz',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
