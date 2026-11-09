import 'package:flutter/material.dart';
import 'package:universitys_gate/app/router/route_names.dart';
import 'package:universitys_gate/app/theme/app_colors.dart';
import 'package:universitys_gate/features/authentication/presentation/widgets/login_form.dart';
import 'package:universitys_gate/features/authentication/presentation/widgets/login_header.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = RouteNames.login;

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _rememberMe = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    final backgroundColor = isDark
        ? DarkAppColors.background
        : AppColors.background;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          // Background Gradient
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: isDark
                      ?  [
                    DarkAppColors.gradientStart,
                    DarkAppColors.gradientMiddle,
                    DarkAppColors.gradientEnd,
                  ]
                      : [
                    AppColors.gradientStart,
                    AppColors.gradientMiddle,
                    AppColors.gradientEnd,
                  ],
                ),
              ),
            ),
          ),

          // Login Illustration
          Positioned(
            top: 90,
            right: 0,
            width: size.width * 0.60,
            height: 270,
            child: Image.asset(
              'assets/images/login.png',
              fit: BoxFit.contain,
              alignment: Alignment.topRight,
              errorBuilder: (context, error, stackTrace) =>
                  SizedBox.shrink(),
            ),
          ),

          // Screen Content
          SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    LoginHeader(
                      screenWidth: size.width,
                    ),

                    SizedBox(height: 60),

                    LoginForm(
                      emailController: _emailController,
                      passwordController: _passwordController,
                      obscurePassword: _obscurePassword,
                      rememberMe: _rememberMe,

                      onTogglePassword: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },

                      onRememberMeChanged: (value) {
                        setState(() {
                          _rememberMe = value;
                        });
                      },

                      onLogin: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // LoginCubit
                        }
                      },

                      onForgotPassword: () {
                        // Navigate to Forgot Password
                      },

                      onGoogleLogin: () {
                        // Google Sign In
                      },

                      onAppleLogin: () {
                        // Apple Sign In
                      },

                      onCreateAccount: () {
                        // Navigate to Register
                      },
                    ),

                    SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}