import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universitys_gate/app/router/route_names.dart';
import 'package:universitys_gate/app/theme/app_colors.dart';
import 'package:universitys_gate/app/theme/app_radius.dart';


class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color primaryColor = isDark ? DarkAppColors.primary : AppColors.primary;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildBackButton(context, colorScheme),
            _buildLogo(colorScheme, primaryColor),
            SizedBox(width: 40.w),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context, ColorScheme colorScheme) {
    return InkWell(
      onTap: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        } else {
          Navigator.pushReplacementNamed(context, RouteNames.appSetup);
        }
      },
      borderRadius: BorderRadius.circular(AppRadius.radius12),
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(AppRadius.radius12),
          border: Border.all(
            color: colorScheme.onSurface.withValues(alpha: 0.15),
          ),
        ),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 18.r,
          color: colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _buildLogo(ColorScheme colorScheme, Color primaryColor) {
    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 55.w,
            height: 55.w,
            fit: BoxFit.contain,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Uni',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w800,
                  color: colorScheme.onSurface,
                ),
              ),
              Text(
                'Gate',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w800,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
