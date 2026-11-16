import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universitys_gate/app/theme/app_colors.dart';
import 'package:universitys_gate/app/theme/app_dimensions.dart';
import 'package:universitys_gate/app/theme/app_text_styles.dart';
import 'package:universitys_gate/core/widgets/app_button.dart';

class AppEmptyState extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Widget? customIllustration;
  final String? actionText;
  final VoidCallback? onAction;

  const AppEmptyState({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.customIllustration,
    this.actionText,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDark ? DarkAppColors.primary : AppColors.primary;
    final textMuted = isDark ? DarkAppColors.textMuted : AppColors.textMuted;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.screenPaddingLarge.w,
          vertical: AppDimensions.spacing24.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (customIllustration != null)
              customIllustration!
            else
              Container(
                width: AppDimensions.imageMedium.r,
                height: AppDimensions.imageMedium.r,
                decoration: BoxDecoration(
                  color: primaryColor.withValues(alpha: 0.08),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon ?? Icons.inbox_rounded,
                  size: AppDimensions.iconExtraLarge.r,
                  color: primaryColor,
                ),
              ),
            SizedBox(height: AppDimensions.spacing20.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: (isDark
                      ? AppTextStyles.darkTitleLarge
                      : AppTextStyles.lightTitleLarge)
                  .copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (subtitle != null) ...[
              SizedBox(height: AppDimensions.spacing8.h),
              Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: (isDark
                        ? AppTextStyles.darkBodyMedium
                        : AppTextStyles.lightBodyMedium)
                    .copyWith(
                  fontSize: 14.sp,
                  color: textMuted,
                ),
              ),
            ],
            if (onAction != null && actionText != null) ...[
              SizedBox(height: AppDimensions.spacing24.h),
              SizedBox(
                width: 180.w,
                child: AppButton(
                  text: actionText!,
                  onPressed: onAction,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
