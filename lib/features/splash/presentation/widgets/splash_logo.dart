import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashLogo extends StatelessWidget {
  final Animation<double> scaleAnimation;
  final Animation<double> fadeAnimation;

  const SplashLogo({
    super.key,
    required this.scaleAnimation,
    required this.fadeAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Image.asset(
          'assets/images/logo.png',
          width: 150.r,
          height: 150.r,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
