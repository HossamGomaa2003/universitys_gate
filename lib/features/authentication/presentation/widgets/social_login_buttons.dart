import 'package:flutter/material.dart';
import 'package:universitys_gate/app/theme/app_colors.dart';
import 'package:universitys_gate/app/theme/app_radius.dart';

class SocialLoginButtons extends StatelessWidget {
  final VoidCallback onGoogleTap;
  final VoidCallback onAppleTap;

  const SocialLoginButtons({
    super.key,
    required this.onGoogleTap,
    required this.onAppleTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    final background = isDark
        ? DarkAppColors.surface
        : AppColors.surface;

    final border = isDark
        ? DarkAppColors.border
        : AppColors.border;

    return Row(
      children: [
        Expanded(
          child: _SocialLoginButton(
            backgroundColor: background,
            borderColor: border,
            icon: Image.asset(
              'assets/icons/google.webp',
              width: 24,
              height: 24,
            ),
            onTap: onGoogleTap,
          ),
        ),

        SizedBox(width: 12),

        Expanded(
          child: _SocialLoginButton(
            backgroundColor: background,
            borderColor: border,
            icon: Image.asset(
              'assets/icons/apple.png',
              width: 24,
              height: 24,
              color: isDark ? Colors.white : null,
            ),
            onTap: onAppleTap,
          ),
        ),
      ],
    );
  }
}

class _SocialLoginButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color borderColor;

  const _SocialLoginButton({
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
        borderRadius: BorderRadius.circular(
          AppRadius.radius12,
        ),
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(
              AppRadius.radius12,
            ),
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