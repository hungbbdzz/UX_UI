import 'package:flutter/material.dart';

/// Màn hình: S18 – Personal profile
/// Figma Frame ID: 11:3798 | Nhóm: Part A · Member 1 — Onboarding, personalization and progress (S01–S24)
class S18PersonalProfileScreen extends StatelessWidget {
  const S18PersonalProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),
      appBar: AppBar(
        title: Text(
          'S18 – Personal profile',
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
                          color: const Color(0xFF2A14B4).withOpacity(0.08),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'Part A · Member 1',
                          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF2A14B4)),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '390 x 1740 px',
                        style: const TextStyle(fontSize: 12, color: Color(0xFF777586), fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'S18 – Personal profile',
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
                  'Các liên kết Prototype từ Figma (20):',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF2A14B4)),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Tương tác Prototype: ON_CLICK -> S69 – Certificates
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
                  const SnackBar(content: Text('Liên kết chuyển tiếp sang S69 – Certificates (Part C · Member 3 — Practice, assessments, grades and challenges (S49–S72))')),
                ),
                icon: const Icon(Icons.open_in_new_rounded, size: 18),
                label: Text(
                  'Certificates → S69 – Certificates',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S15 – Badges
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
                onPressed: () => Navigator.pushNamed(context, '/s15badges'),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(
                  'Badges → S15 – Badges',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S97 – Instructor dashboard
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
                  const SnackBar(content: Text('Liên kết chuyển tiếp sang S97 – Instructor dashboard (Part E · Member 5 — Instructor and administration (S97–S120))')),
                ),
                icon: const Icon(Icons.open_in_new_rounded, size: 18),
                label: Text(
                  'Link → S97 – Instructor dashboard',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S19 – Edit profile
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
                onPressed: () => Navigator.pushNamed(context, '/s19editprofile'),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(
                  'Link - 1. Edit Profile → S19 – Edit profile',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S20 – Skill tree
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
                onPressed: () => Navigator.pushNamed(context, '/s20skilltree'),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(
                  'Link - 2. Skill Tree → S20 – Skill tree',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S13 – Weekly goals
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
                onPressed: () => Navigator.pushNamed(context, '/s13weeklygoals'),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(
                  'Link - 3. Weekly Goals → S13 – Weekly goals',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S22 – Learning settings
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
                onPressed: () => Navigator.pushNamed(context, '/s22learningsettings'),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(
                  'Link - 4. Study Settings → S22 – Learning settings',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S95 – Invite friends
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
                  const SnackBar(content: Text('Liên kết chuyển tiếp sang S95 – Invite friends (Part D · Member 4 — Live classes, community and payments (S73–S96))')),
                ),
                icon: const Icon(Icons.open_in_new_rounded, size: 18),
                label: Text(
                  'Link - 5. Refer a Friend → S95 – Invite friends',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S96 – Help center
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
                  const SnackBar(content: Text('Liên kết chuyển tiếp sang S96 – Help center (Part D · Member 4 — Live classes, community and payments (S73–S96))')),
                ),
                icon: const Icon(Icons.open_in_new_rounded, size: 18),
                label: Text(
                  'Link - 6. Help & Support → S96 – Help center',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S14 – Learning statistics
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
                onPressed: () => Navigator.pushNamed(context, '/s14learningstatistics'),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(
                  'Link - Learning Statistics → S14 – Learning statistics',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S68 – Gradebook
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
                  const SnackBar(content: Text('Liên kết chuyển tiếp sang S68 – Gradebook (Part C · Member 3 — Practice, assessments, grades and challenges (S49–S72))')),
                ),
                icon: const Icon(Icons.open_in_new_rounded, size: 18),
                label: Text(
                  'Link - Gradebook → S68 – Gradebook',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S66 – Assignment queue
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
                  const SnackBar(content: Text('Liên kết chuyển tiếp sang S66 – Assignment queue (Part C · Member 3 — Practice, assessments, grades and challenges (S49–S72))')),
                ),
                icon: const Icon(Icons.open_in_new_rounded, size: 18),
                label: Text(
                  'Link - Assignments → S66 – Assignment queue',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S93 – Transaction history
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
                  const SnackBar(content: Text('Liên kết chuyển tiếp sang S93 – Transaction history (Part D · Member 4 — Live classes, community and payments (S73–S96))')),
                ),
                icon: const Icon(Icons.open_in_new_rounded, size: 18),
                label: Text(
                  'Link - Transactions → S93 – Transaction history',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S19 – Edit profile
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
                onPressed: () => Navigator.pushNamed(context, '/s19editprofile'),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(
                  'Link - Primary Edit Button → S19 – Edit profile',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> A01 – Shared sign-in
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
                onPressed: () => Navigator.pushNamed(context, '/a01sharedsignin'),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(
                  'Button - Log Out Secondary Danger Action → A01 – Shared sign-in',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
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
                  'Background+Shadow → Quay lại màn hình trước',
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
            // Tương tác Prototype: ON_CLICK -> S46 – My courses
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
                onPressed: () => Navigator.pushNamed(context, '/s46mycourses'),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(
                  'GO:S46 / Courses → S46 – My courses',
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
          ],
        ),
      ),
    );
  }
}
