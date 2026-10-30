import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:universitys_gate/app/theme/app_colors.dart';
import 'package:universitys_gate/app/theme/app_radius.dart';
import 'package:universitys_gate/app/theme/app_text_styles.dart';


class OnboardingControls {
  static Widget skip([BuildContext? context]) {
    final bool isDark = context != null && Theme.of(context).brightness == Brightness.dark;
    final Color primaryColor = isDark ? DarkAppColors.primary : AppColors.primary;

    return Text(
      'onboarding.skip'.tr(),
      style: (isDark ? AppTextStyles.darkButton : AppTextStyles.lightButton).copyWith(
        color: primaryColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  static Widget back(BuildContext context) {
    final bool isRtl = context.locale.languageCode == 'ar';
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color primaryColor = isDark ? DarkAppColors.primary : AppColors.primary;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isRtl ? Icons.arrow_forward_rounded : Icons.arrow_back_rounded,
          size: 20.r,
          color: primaryColor,
        ),
        SizedBox(width: 4.w),
        Text(
          'onboarding.back'.tr(),
          style: (isDark ? AppTextStyles.darkButton : AppTextStyles.lightButton).copyWith(
            color: primaryColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  static Widget next(BuildContext context) {
    return _buildActionButton(context, text: 'onboarding.next');
  }

  static Widget done(BuildContext context) {
    return _buildActionButton(context, text: 'onboarding.get_started');
  }

  static Widget _buildActionButton(
    BuildContext context, {
    required String text,
  }) {
    final bool isRtl = context.locale.languageCode == 'ar';
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final TextStyle buttonStyle = isDark ? AppTextStyles.darkButton : AppTextStyles.lightButton;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text.tr(),
          style: buttonStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 6.w),
        Icon(
          isRtl ? Icons.arrow_back_rounded : Icons.arrow_forward_rounded,
          size: 20.r,
          color: Colors.white,
        ),
      ],
    );
  }

  static ButtonStyle backStyle([BuildContext? context]) {
    return ButtonStyle(
      padding: WidgetStateProperty.all(
        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      ),
    );
  }

  static ButtonStyle nextStyle([BuildContext? context]) {
    final bool isDark = context != null && Theme.of(context).brightness == Brightness.dark;
    final Color primaryColor = isDark ? DarkAppColors.primary : AppColors.primary;

    return ButtonStyle(
      backgroundColor: WidgetStateProperty.all(primaryColor),
      padding: WidgetStateProperty.all(
        EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.button),
        ),
      ),
    );
  }

  static ButtonStyle doneStyle([BuildContext? context]) {
    final bool isDark = context != null && Theme.of(context).brightness == Brightness.dark;
    final Color primaryColor = isDark ? DarkAppColors.primary : AppColors.primary;

    return ButtonStyle(
      backgroundColor: WidgetStateProperty.all(primaryColor),
      padding: WidgetStateProperty.all(
        EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.radius4),
        ),
      ),
    );
  }

  static DotsDecorator dotsDecorator([BuildContext? context]) {
    final bool isDark = context != null && Theme.of(context).brightness == Brightness.dark;
    final Color primaryColor = isDark ? DarkAppColors.primary : AppColors.primary;

    return DotsDecorator(
      size: Size(10.w, 10.h),
      activeSize: Size(24.w, 10.h),
      color: primaryColor.withValues(alpha: 0.2),
      activeColor: primaryColor,
      spacing: EdgeInsets.symmetric(horizontal: 4.w),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.radius4),
      ),
    );
  }
}
