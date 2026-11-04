import 'package:flutter/material.dart';

/// Màn hình: S46 – My courses
/// Figma Frame ID: 34:549 | Nhóm: Part B · Member 2 — Course discovery and learning content (S25–S48)
class S46MyCoursesScreen extends StatelessWidget {
  const S46MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),
      appBar: AppBar(
        title: Text(
          'S46 – My courses',
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
                        '390 x 1255 px',
                        style: const TextStyle(fontSize: 12, color: Color(0xFF777586), fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'S46 – My courses',
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
                  'Các liên kết Prototype từ Figma (10):',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF2A14B4)),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Tương tác Prototype: ON_CLICK -> S47 – Course progress details
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
                onPressed: () => Navigator.pushNamed(context, '/s47courseprogressdetails'),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(
                  'Practical Python for Data Analysis & ... → S47 – Course progress details',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S36 – Video player
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
                onPressed: () => Navigator.pushNamed(context, '/s36videoplayer'),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(
                  'Button → S36 – Video player',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S47 – Course progress details
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
                onPressed: () => Navigator.pushNamed(context, '/s47courseprogressdetails'),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(
                  'English for Tech Careers: Interviews ... → S47 – Course progress details',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S37 – Audio lesson
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
                onPressed: () => Navigator.pushNamed(context, '/s37audiolesson'),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(
                  'Button → S37 – Audio lesson',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S47 – Course progress details
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
                onPressed: () => Navigator.pushNamed(context, '/s47courseprogressdetails'),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(
                  'Data Engineering Essentials: Stream M... → S47 – Course progress details',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S38 – Reading lesson
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
                onPressed: () => Navigator.pushNamed(context, '/s38readinglesson'),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(
                  'Button → S38 – Reading lesson',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S10 – Learner home
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
                onPressed: () => Navigator.pushNamed(context, '/s10learnerhome'),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(
                  'GO:S10 / Home → S10 – Learner home',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S25 – Explore
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
                onPressed: () => Navigator.pushNamed(context, '/s25explore'),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(
                  'GO:S25 / Explore → S25 – Explore',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S79 – Forum
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
                  const SnackBar(content: Text('Liên kết chuyển tiếp sang S79 – Forum (Part D · Member 4 — Live classes, community and payments (S73–S96))')),
                ),
                icon: const Icon(Icons.open_in_new_rounded, size: 18),
                label: Text(
                  'GO:S79 / Community → S79 – Forum',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S18 – Personal profile
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
                onPressed: () => Navigator.pushNamed(context, '/s18personalprofile'),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(
                  'GO:S18 / Profile → S18 – Personal profile',
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
