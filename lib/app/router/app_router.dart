import 'package:flutter/material.dart';

import '../../features/app_setup/presentation/screens/app_setup_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import 'route_names.dart';

abstract class AppRouter {
  AppRouter._();

  static Map<String, WidgetBuilder> get routes => {
        RouteNames.splash: (context) => const SplashScreen(),
        RouteNames.appSetup: (context) => const AppSetupScreen(),
        RouteNames.onboarding: (context) => OnboardingScreen(
              onFinished: () {
                Navigator.pushReplacementNamed(context, RouteNames.splash);
              },
            ),
      };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );
      case RouteNames.appSetup:
        return MaterialPageRoute(
          builder: (context) => const AppSetupScreen(),
          settings: settings,
        );
      case RouteNames.onboarding:
        return MaterialPageRoute(
          builder: (context) => OnboardingScreen(
            onFinished: () {
              Navigator.pushReplacementNamed(context, RouteNames.splash);
            },
          ),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
    }
  }
}
