import 'package:flutter/material.dart';
import '../widgets/figma_screen.dart';

/// Màn hình: S02 – Feature introduction (Figma UI chuẩn xác cho người dùng)
/// Mã: S02 | Kích thước thiết kế: 390 x 844 px
class S02FeatureIntroductionScreen extends StatelessWidget {
  const S02FeatureIntroductionScreen({super.key});

  static const routeName = '/s02_feature_introduction';

  @override
  Widget build(BuildContext context) {
    return FigmaScreen(
      width: 390,
      height: 844.00,
      background: const Color(0xFFF9F9FF),
      screenCode: 'S02',
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/S02FeatureIntroduction.png',
            width: 390.0,
            height: 844.0,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          // Hotspot: Button -> A01SharedSignIn
          Positioned(
            left: 296.0,
            top: 18.0,
            width: 78.0,
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
          // Hotspot: GO:A02 / Create account -> A02LearnerRegistration
          Positioned(
            left: 16.0,
            top: 716.0,
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
          // Hotspot: GO:A01 / Already have an account? Sign in -> A01SharedSignIn
          Positioned(
            left: 16.0,
            top: 772.0,
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
