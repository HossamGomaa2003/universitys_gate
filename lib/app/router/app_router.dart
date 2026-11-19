import 'package:flutter/material.dart';
import 'package:universitys_gate/features/authentication/presentation/screens/forgot_password_screen.dart';
import 'package:universitys_gate/features/authentication/presentation/screens/register_screen.dart';
import 'package:universitys_gate/features/authentication/presentation/screens/reset_password_screen.dart';
import 'package:universitys_gate/features/authentication/presentation/screens/verify_otp_screen.dart';

import '../../features/app_setup/presentation/screens/app_setup_screen.dart';
import '../../features/authentication/presentation/screens/login_screen.dart';
import '../../features/home/main shell/main_shell_screen.dart';
import '../../features/home/tabs/home tab/presentation/screens/home_screen.dart';
import '../../features/home/tabs/my applications tab/presentation/screens/my_applications_screen.dart';
import '../../features/home/tabs/notifications tab/presentation/screens/notifications_screen.dart';
import '../../features/home/tabs/profile tab/presentation/screens/profile_screen.dart';
import '../../features/home/tabs/universities tab/presentation/screens/universities_screen.dart';
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
        Navigator.pushReplacementNamed(context, RouteNames.login);
      },
    ),
    RouteNames.login: (context) => const LoginScreen(),
    RouteNames.register: (context) => const RegisterScreen(),
    RouteNames.forgotPassword: (context) => const ForgotPasswordScreen(),
    RouteNames.verifyOtp: (context) => const VerifyOtpScreen(),
    RouteNames.resetPassword: (context) => const ResetPasswordScreen(),
    RouteNames.mainShell: (context) => const MainShellScreen(),
    RouteNames.home: (context) => const HomeScreen(),
    RouteNames.universities: (context) => const UniversitiesScreen(),
    RouteNames.myApplications: (context) => const MyApplicationsScreen(),
    RouteNames.notifications: (context) => const NotificationsScreen(),
    RouteNames.profile: (context) => const ProfileScreen(),
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
              Navigator.pushReplacementNamed(context, RouteNames.login);
            },
          ),
          settings: settings,
        );
      case RouteNames.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
          settings: settings,
        );
      case RouteNames.register:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
          settings: settings,
        );
      case RouteNames.forgotPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
          settings: settings,
        );
      case RouteNames.verifyOtp:
        return MaterialPageRoute(
          builder: (context) => const VerifyOtpScreen(),
          settings: settings,
        );
      case RouteNames.resetPassword:
        return MaterialPageRoute(
          builder: (context) => const ResetPasswordScreen(),
          settings: settings,
        );
      case RouteNames.mainShell:
        return MaterialPageRoute(
          builder: (context) => const MainShellScreen(),
          settings: settings,
        );
      case RouteNames.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: settings,
        );
      case RouteNames.universities:
        return MaterialPageRoute(
          builder: (context) => const UniversitiesScreen(),
          settings: settings,
        );
      case RouteNames.myApplications:
        return MaterialPageRoute(
          builder: (context) => const MyApplicationsScreen(),
          settings: settings,
        );
      case RouteNames.notifications:
        return MaterialPageRoute(
          builder: (context) => const NotificationsScreen(),
          settings: settings,
        );
      case RouteNames.profile:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
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