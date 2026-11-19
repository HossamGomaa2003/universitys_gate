import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universitys_gate/app/router/route_names.dart';
import 'package:universitys_gate/app/theme/app_colors.dart';
import 'package:universitys_gate/core/di/injection.dart';
import 'package:universitys_gate/features/authentication/cubit/register/register_cubit.dart';
import 'package:universitys_gate/features/authentication/cubit/register/register_state.dart';
import 'package:universitys_gate/features/authentication/presentation/widgets/register/register_form.dart';
import 'package:universitys_gate/features/authentication/presentation/widgets/register/register_header.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = RouteNames.register;

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (context) => getIt<RegisterCubit>(),
      child: _RegisterScreenContent(),
    );
  }
}

class _RegisterScreenContent extends StatefulWidget {
  const _RegisterScreenContent();

  @override
  State<_RegisterScreenContent> createState() => _RegisterScreenContentState();
}

class _RegisterScreenContentState extends State<_RegisterScreenContent> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreeToTerms = false;
  String? _selectedProfileImage;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onRegister(BuildContext context) {
    if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('auth.must_agree_terms'.tr()),
        ),
      );
      return;
    }

    if (_formKey.currentState?.validate() ?? false) {
      context.read<RegisterCubit>().register(
            name: _nameController.text,
            email: _emailController.text,
            phone: _phoneController.text,
            password: _passwordController.text,
            confirmPassword: _confirmPasswordController.text,
            profileImage: _selectedProfileImage,
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
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('auth.account_created_success'.tr()),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteNames.mainShell,
                  (route) => false,
            );
          } else if (state is RegisterFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is RegisterLoading;

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

              // Right Top Illustration
              Positioned(
                top: 110.h,
                right: 0,
                width: size.width * 0.58,
                height: 250.h,
                child: Image.asset(
                  'assets/images/login.png',
                  fit: BoxFit.contain,
                  alignment: Alignment.topRight,
                  errorBuilder: (context, error, stackTrace) =>
                      SizedBox.shrink(),
                ),
              ),

              // Main Screen Fixed Header & Expandable Scrollable Form
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: RegisterHeader(
                        screenWidth: size.width,
                        onBackPressed: () {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          } else {
                            Navigator.pushReplacementNamed(
                              context,
                              RouteNames.login,
                            );
                          }
                        },
                      ),
                    ),

                    SizedBox(height: 60.h),

                    Expanded(
                      child: Form(
                        key: _formKey,
                        child: RegisterForm(
                          nameController: _nameController,
                          emailController: _emailController,
                          phoneController: _phoneController,
                          passwordController: _passwordController,
                          confirmPasswordController: _confirmPasswordController,
                          obscurePassword: _obscurePassword,
                          obscureConfirmPassword: _obscureConfirmPassword,
                          agreeToTerms: _agreeToTerms,
                          isLoading: isLoading,
                          onTogglePassword: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          onToggleConfirmPassword: () {
                            setState(() {
                              _obscureConfirmPassword = !_obscureConfirmPassword;
                            });
                          },
                          onAgreeToTermsChanged: (value) {
                            setState(() {
                              _agreeToTerms = value;
                            });
                          },
                          onRegister: () => _onRegister(context),
                          onGoogleRegister: () {
                            // Google Sign-Up
                          },
                          onAppleRegister: () {
                            // Apple Sign-Up
                          },
                          onLoginTap: () {
                            if (Navigator.canPop(context)) {
                              Navigator.pop(context);
                            } else {
                              Navigator.pushReplacementNamed(
                                context,
                                RouteNames.login,
                              );
                            }
                          },
                          onProfileImageSelected: (imagePath) {
                            setState(() {
                              _selectedProfileImage = imagePath;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
