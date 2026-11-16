import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universitys_gate/app/theme/app_colors.dart';
import 'package:universitys_gate/app/theme/app_text_styles.dart';

import 'package:universitys_gate/features/authentication/presentation/widgets/login/email_text_field.dart';
import 'package:universitys_gate/features/authentication/presentation/widgets/login/login_button.dart';
import 'package:universitys_gate/features/authentication/presentation/widgets/login/password_text_field.dart';
import 'package:universitys_gate/features/authentication/presentation/widgets/login/remember_me_row.dart';
import 'package:universitys_gate/features/authentication/presentation/widgets/login/signup_prompt.dart';
import 'package:universitys_gate/features/authentication/presentation/widgets/login/social_login_buttons.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  final bool obscurePassword;
  final bool rememberMe;
  final bool isLoading;

  final VoidCallback onTogglePassword;
  final ValueChanged<bool> onRememberMeChanged;

  final VoidCallback onLogin;
  final VoidCallback onForgotPassword;
  final VoidCallback onGoogleLogin;
  final VoidCallback onAppleLogin;
  final VoidCallback onCreateAccount;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.obscurePassword,
    required this.rememberMe,
    this.isLoading = false,
    required this.onTogglePassword,
    required this.onRememberMeChanged,
    required this.onLogin,
    required this.onForgotPassword,
    required this.onGoogleLogin,
    required this.onAppleLogin,
    required this.onCreateAccount,
  });

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    final isRtl = context.locale.languageCode == 'ar';

    final cardBg = isDark
        ? DarkAppColors.cardBackground
        : AppColors.cardBackground;

    final border = isDark
        ? DarkAppColors.border
        : AppColors.border;

    return Container(
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(28.r),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.25)
                : AppColors.primaryDark.withValues(alpha: 0.06),
            blurRadius: 24.r,
            offset: Offset(0, 8.h),
          ),
        ],
      ),

      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 28.h,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'auth.welcome_back'.tr(),
            style: (isDark
                    ? AppTextStyles.darkHeadlineLarge
                    : AppTextStyles.lightHeadlineLarge)
                .copyWith(
              fontSize: 26.sp,
              letterSpacing: -0.5,
            ),
          ),

          SizedBox(height: 6.h),

          // Subtitle
          Text(
            'auth.login_subtitle'.tr(),
            style: (isDark
                    ? AppTextStyles.darkBodyMedium
                    : AppTextStyles.lightBodyMedium)
                .copyWith(
              fontSize: 14.sp,
            ),
          ),

          SizedBox(height: 24.h),

          // Email
          EmailTextField(
            controller: emailController,
          ),

          SizedBox(height: 16.h),

          // Password
          PasswordTextField(
            controller: passwordController,
            obscureText: obscurePassword,
            onToggleVisibility: onTogglePassword,
          ),

          SizedBox(height: 14.h),

          // Remember Me
          RememberMeRow(
            value: rememberMe,
            onChanged: onRememberMeChanged,
            onForgotPassword: onForgotPassword,
          ),

          SizedBox(height: 22.h),

          // Login Button
          LoginButton(
            isRtl: isRtl,
            isLoading: isLoading,
            onPressed: onLogin,
          ),

          SizedBox(height: 24.h),

          // Divider
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: border,
                  thickness: 1,
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                child: Text(
                  'auth.or'.tr(),
                  style: (isDark
                          ? AppTextStyles.darkBodySmall
                          : AppTextStyles.lightBodySmall)
                      .copyWith(
                    fontSize: 13.sp,
                  ),
                ),
              ),

              Expanded(
                child: Divider(
                  color: border,
                  thickness: 1,
                ),
              ),
            ],
          ),

          SizedBox(height: 22.h),

          // Social Login
          SocialLoginButtons(
            onGoogleTap: onGoogleLogin,
            onAppleTap: onAppleLogin,
          ),

          SizedBox(height: 24.h),

          // Create Account
          SignupPrompt(
            onTap: onCreateAccount,
          ),
        ],
      ),
    );
  }
}
