import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universitys_gate/app/router/route_names.dart';
import 'package:universitys_gate/app/theme/app_colors.dart';
import 'package:universitys_gate/core/di/injection.dart';
import 'package:universitys_gate/features/authentication/cubit/login/login_cubit.dart';
import 'package:universitys_gate/features/authentication/cubit/login/login_state.dart';
import 'package:universitys_gate/features/authentication/presentation/widgets/login/login_form.dart';
import 'package:universitys_gate/features/authentication/presentation/widgets/login/login_header.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = RouteNames.login;

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => getIt<LoginCubit>(),
      child: const _LoginScreenContent(),
    );
  }
}

class _LoginScreenContent extends StatefulWidget {
  const _LoginScreenContent();

  @override
  State<_LoginScreenContent> createState() => _LoginScreenContentState();
}

class _LoginScreenContentState extends State<_LoginScreenContent> {
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

  void _onLogin(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<LoginCubit>().login(
            email: _emailController.text,
            password: _passwordController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final backgroundColor = isDark
        ? DarkAppColors.background
        : AppColors.background;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('auth.login_success'.tr()),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is LoginLoading;

          return Stack(
            children: [
              // Background Gradient
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: isDark
                          ? [
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
                top: 115.h,
                right: 0,
                width: size.width * 0.60,
                height: 270.h,
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
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        LoginHeader(
                          screenWidth: size.width,
                        ),

                        SizedBox(height: 100.h),

                        LoginForm(
                          emailController: _emailController,
                          passwordController: _passwordController,
                          obscurePassword: _obscurePassword,
                          rememberMe: _rememberMe,
                          isLoading: isLoading,
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
                          onLogin: () => _onLogin(context),
                          onForgotPassword: () {
                            Navigator.pushNamed(
                              context,
                              RouteNames.forgotPassword,
                            );
                          },
                          onGoogleLogin: () {
                            // Google Sign In
                          },
                          onAppleLogin: () {
                            // Apple Sign In
                          },
                          onCreateAccount: () {
                            Navigator.pushNamed(
                              context,
                              RouteNames.register,
                            );
                          },
                        ),

                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
