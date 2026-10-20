import 'package:flutter/material.dart';

import '../../../../app/router/route_names.dart';
import '../../../../app/theme/app_colors.dart';
import '../widgets/splash_bubbles.dart';
import '../widgets/splash_loading.dart';
import '../widgets/splash_logo.dart';
import '../widgets/splash_title.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = RouteNames.splash;

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _logoScale;
  late final Animation<double> _logoFade;
  late final Animation<double> _textFade;
  late final Animation<Offset> _textSlide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2200),
    );

    // Logo Scale Animation
    _logoScale = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          0.65,
          curve: Curves.easeOutBack,
        ),
      ),
    );

    // Logo Fade Animation
    _logoFade = CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.0,
        0.4,
        curve: Curves.easeIn,
      ),
    );

    // Text Fade Animation
    _textFade = CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.45,
        0.85,
        curve: Curves.easeIn,
      ),
    );

    // Text Slide Animation
    _textSlide = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.45,
          0.85,
          curve: Curves.easeOut,
        ),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.surface,
              AppColors.background,
              AppColors.secondary.withValues(alpha: 0.1),
            ],
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Static Background Bubbles
            Positioned.fill(
              child: IgnorePointer(
                child: SplashBubbles(),
              ),
            ),

            // Main Splash Content
            SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 2),

                    // Animated Logo
                    SplashLogo(
                      scaleAnimation: _logoScale,
                      fadeAnimation: _logoFade,
                    ),

                    SizedBox(height: 5),

                    // App Name and Tagline
                    SplashTitle(
                      fadeAnimation: _textFade,
                      slideAnimation: _textSlide,
                    ),

                    Spacer(flex: 2),

                    // Loading Indicator
                    SplashLoading(),

                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}