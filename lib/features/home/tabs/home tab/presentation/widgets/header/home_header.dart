import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import 'package:universitys_gate/app/theme/app_colors.dart';
import 'package:universitys_gate/app/theme/app_text_styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final primaryColor = isDark
        ? DarkAppColors.primary
        : AppColors.primary;

    final logoTextStyle = isDark
        ? AppTextStyles.darkDisplayMedium
        : AppTextStyles.lightDisplayMedium;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 60.r,
              width: 60.r,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 48.r,
                  width: 48.r,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Icons.school,
                    color: Colors.white,
                    size: 28.r,
                  ),
                );
              },
            ),

            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Uni',
                    style: logoTextStyle.copyWith(
                      fontSize: 28.sp,
                      letterSpacing: -0.5,
                    ),
                  ),
                  TextSpan(
                    text: 'Gate',
                    style: logoTextStyle.copyWith(
                      fontSize: 28.sp,
                      color: primaryColor,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        GestureDetector(
          onTap: () {
            // TODO: Navigate to AI Chatbot.
          },
          child: Container(
            width: 44.r,
            height: 44.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF6366F1),
                  Color(0xFF8B5CF6),
                  Color(0xFFEC4899),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF8B5CF6)
                      .withValues(alpha: 0.35),
                  blurRadius: 10.r,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: HugeIcon(
                icon: HugeIcons.strokeRoundedSparkles,
                color: Colors.white,
                size: 24.r,
              ),
            ),
          ),
        ),
      ],
    );
  }
}