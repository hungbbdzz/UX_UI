import 'package:flutter/material.dart';

/// Màn hình: A02 – Learner registration
/// Figma Frame ID: 107:31 | Nhóm: Part A · Member 1 — Onboarding, personalization and progress (S01–S24)
class A02LearnerRegistrationScreen extends StatelessWidget {
  const A02LearnerRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),
      appBar: AppBar(
        title: Text(
          'A02 – Learner registration',
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
                        '390 x 844 px',
                        style: const TextStyle(fontSize: 12, color: Color(0xFF777586), fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'A02 – Learner registration',
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
                  'Các liên kết Prototype từ Figma (3):',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF2A14B4)),
                ),
              ],
            ),
            const SizedBox(height: 12),

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
                  'GO:A01 / ‹ → A01 – Shared sign-in',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Tương tác Prototype: ON_CLICK -> S03 – Select learning goal
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
                onPressed: () => Navigator.pushNamed(context, '/s03selectlearninggoal'),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(
                  'GO:AUTH:register / Create learner acc... → S03 – Select learning goal',
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
                  'GO:A01 / Already have an account? Sig... → A01 – Shared sign-in',
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
