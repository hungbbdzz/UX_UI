import 'package:flutter/material.dart';
import '../widgets/figma_screen.dart';

/// Màn hình: A02 – Learner registration (Figma UI chuẩn xác cho người dùng)
/// Mã: A02 | Kích thước thiết kế: 390 x 844 px
class A02LearnerRegistrationScreen extends StatelessWidget {
  const A02LearnerRegistrationScreen({super.key});

  static const routeName = '/a02_learner_registration';

  @override
  Widget build(BuildContext context) {
    return FigmaScreen(
      width: 390,
      height: 844.00,
      background: const Color(0xFFF9F9FF),
      screenCode: 'A02',
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/A02LearnerRegistration.png',
            width: 390.0,
            height: 844.0,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          // Hotspot: GO:A01 / ‹ -> A01SharedSignIn
          Positioned(
            left: 16.0,
            top: 10.0,
            width: 44.0,
            height: 44.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/a01_shared_sign_in');
                },
              ),
            ),
          ),
          // Hotspot: GO:AUTH:register / Create learner account -> S03SelectLearningGoal
          Positioned(
            left: 16.0,
            top: 797.0,
            width: 358.0,
            height: 48.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/s03_select_learning_goal');
                },
              ),
            ),
          ),
          // Hotspot: GO:A01 / Already have an account? Sign in -> A01SharedSignIn
          Positioned(
            left: 16.0,
            top: 861.0,
            width: 358.0,
            height: 48.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/a01_shared_sign_in');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
