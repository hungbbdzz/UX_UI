import 'package:flutter/material.dart';
import '../widgets/figma_screen.dart';

/// Màn hình: A01 – Shared sign-in (Figma UI chuẩn xác cho người dùng)
/// Mã: A01 | Kích thước thiết kế: 390 x 844 px
class A01SharedSignInScreen extends StatelessWidget {
  const A01SharedSignInScreen({super.key});

  static const routeName = '/a01_shared_sign_in';

  @override
  Widget build(BuildContext context) {
    return FigmaScreen(
      width: 390,
      height: 844.00,
      background: const Color(0xFFF9F9FF),
      screenCode: 'A01',
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/A01SharedSignIn.png',
            width: 390.0,
            height: 844.0,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          // Hotspot: GO:S02 / ‹ -> S02FeatureIntroduction
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
                  Navigator.pushNamed(context, '/s02_feature_introduction');
                },
              ),
            ),
          ),
          // Hotspot: GO:AUTH:login / Sign in -> S10LearnerHome
          Positioned(
            left: 16.0,
            top: 487.0,
            width: 358.0,
            height: 48.0,
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
          // Hotspot: GO:A02 / Create learner account -> A02LearnerRegistration
          Positioned(
            left: 16.0,
            top: 551.0,
            width: 358.0,
            height: 48.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/a02_learner_registration');
                },
              ),
            ),
          ),
          // Hotspot: GO:A03 / Instructor registration -> A03InstructorRegistration
          Positioned(
            left: 16.0,
            top: 615.0,
            width: 358.0,
            height: 48.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: const Color(0x33FD761A),
                highlightColor: const Color(0x1AFD761A),
                onTap: () {
                  Navigator.pushNamed(context, '/a03instructorregistration');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
