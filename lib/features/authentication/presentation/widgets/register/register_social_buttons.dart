import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universitys_gate/app/theme/app_colors.dart';
import 'package:universitys_gate/app/theme/app_radius.dart';

class RegisterSocialButtons extends StatelessWidget {
  final VoidCallback onGoogleTap;
  final VoidCallback onAppleTap;

  const RegisterSocialButtons({
    super.key,
    required this.onGoogleTap,
    required this.onAppleTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final background = isDark ? DarkAppColors.surface : AppColors.surface;
    final border = isDark ? DarkAppColors.border : AppColors.border;

    return Row(
      children: [
        // Google Button
        Expanded(
          child: _SocialButton(
            backgroundColor: background,
            borderColor: border,
            icon: Image.asset(
              'assets/icons/google.webp',
              width: 24.r,
              height: 24.r,
            ),
            onTap: onGoogleTap,
          ),
        ),

        SizedBox(width: 12.w),

        // Apple Button
        Expanded(
          child: _SocialButton(
            backgroundColor: background,
            borderColor: border,
            icon: Image.asset(
              'assets/icons/apple.png',
              width: 24.r,
              height: 24.r,
              color: isDark ? Colors.white : Colors.black,
            ),
            onTap: onAppleTap,
          ),
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color borderColor;

  const _SocialButton({
    required this.icon,
    required this.onTap,
    required this.backgroundColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.radius12.r),
        child: Container(
          height: 48.h,
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(AppRadius.radius12.r),
            color: backgroundColor,
          ),
          child: Center(
            child: icon,
          ),
        ),
      ),
    );
  }
}
