import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universitys_gate/app/theme/app_colors.dart';
import 'package:universitys_gate/app/theme/app_text_styles.dart';

import 'confirm_password_text_field.dart';
import 'email_text_field.dart';
import 'login_prompt.dart';
import 'name_text_field.dart';
import 'password_text_field.dart';
import 'phone_text_field.dart';
import 'profile_image_picker.dart';
import 'register_button.dart';
import 'register_social_buttons.dart';
import 'terms_checkbox.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  final bool obscurePassword;
  final bool obscureConfirmPassword;
  final bool agreeToTerms;
  final bool isLoading;

  final VoidCallback onTogglePassword;
  final VoidCallback onToggleConfirmPassword;
  final ValueChanged<bool> onAgreeToTermsChanged;

  final VoidCallback onRegister;
  final VoidCallback onGoogleRegister;
  final VoidCallback onAppleRegister;
  final VoidCallback onLoginTap;
  final ValueChanged<String?>? onProfileImageSelected;

  const RegisterForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.obscurePassword,
    required this.obscureConfirmPassword,
    required this.agreeToTerms,
    this.isLoading = false,
    required this.onTogglePassword,
    required this.onToggleConfirmPassword,
    required this.onAgreeToTermsChanged,
    required this.onRegister,
    required this.onGoogleRegister,
    required this.onAppleRegister,
    required this.onLoginTap,
    this.onProfileImageSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final cardBg = isDark
        ? DarkAppColors.cardBackground
        : AppColors.cardBackground;

    final border = isDark
        ? DarkAppColors.border
        : AppColors.border;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28.r),
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.25)
                : AppColors.primaryDark.withValues(alpha: 0.06),
            blurRadius: 24.r,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28.r),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 22.w,
            vertical: 24.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

          // Title
          Text(
            'auth.create_account_title'.tr(),
            style: (isDark
                    ? AppTextStyles.darkHeadlineLarge
                    : AppTextStyles.lightHeadlineLarge)
                .copyWith(
              fontSize: 26.sp,
              letterSpacing: -0.5,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 4.h),

          // Subtitle
          Text(
            'auth.register_subtitle'.tr(),
            style: (isDark
                    ? AppTextStyles.darkBodyMedium
                    : AppTextStyles.lightBodyMedium)
                .copyWith(
              fontSize: 14.sp,
            ),
          ),

          SizedBox(height: 20.h),

              // Profile Image Picker
              ProfileImagePicker(
                onImageSelected: onProfileImageSelected,
              ),
          SizedBox(height: 20.h),


          // Name
          NameTextField(
            controller: nameController,
          ),

          SizedBox(height: 14.h),

          // Email
          EmailTextField(
            controller: emailController,
          ),

          SizedBox(height: 14.h),

          // Phone
          PhoneTextField(
            controller: phoneController,
          ),

          SizedBox(height: 14.h),

          // Password
          PasswordTextField(
            controller: passwordController,
            obscureText: obscurePassword,
            onToggleVisibility: onTogglePassword,
          ),

          SizedBox(height: 14.h),

          // Confirm Password
          ConfirmPasswordTextField(
            controller: confirmPasswordController,
            originalPasswordController: passwordController,
            obscureText: obscureConfirmPassword,
            onToggleVisibility: onToggleConfirmPassword,
          ),

          SizedBox(height: 16.h),

          // Terms Checkbox
          TermsCheckbox(
            value: agreeToTerms,
            onChanged: onAgreeToTermsChanged,
            onTermsTap: () {
              // Open Terms
            },
            onPrivacyTap: () {
              // Open Privacy
            },
          ),

          SizedBox(height: 20.h),

          // Register Button
          RegisterButton(
            onPressed: onRegister,
            isLoading: isLoading,
          ),

          SizedBox(height: 20.h),

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
                padding: EdgeInsets.symmetric(horizontal: 14.w),
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

          SizedBox(height: 20.h),

          // Social Buttons
          RegisterSocialButtons(
            onGoogleTap: onGoogleRegister,
            onAppleTap: onAppleRegister,
          ),

          SizedBox(height: 22.h),

          // Login Prompt
          LoginPrompt(
            onTap: onLoginTap,
          ),

          SizedBox(height: 12.h),
        ],
      ),
    ),
  ),
);
  }
}
