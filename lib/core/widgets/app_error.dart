import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universitys_gate/app/theme/app_colors.dart';
import 'package:universitys_gate/app/theme/app_dimensions.dart';
import 'package:universitys_gate/app/theme/app_text_styles.dart';
import 'package:universitys_gate/core/widgets/app_button.dart';

class AppError extends StatelessWidget {
  final String? message;
  final VoidCallback? onRetry;
  final String? retryText;
  final IconData? icon;

  const AppError({
    super.key,
    this.message,
    this.onRetry,
    this.retryText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final errorColor = isDark ? DarkAppColors.error : AppColors.error;

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
            Container(
              width: AppDimensions.imageSmall.r,
              height: AppDimensions.imageSmall.r,
              decoration: BoxDecoration(
                color: errorColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon ?? Icons.error_outline_rounded,
                size: AppDimensions.iconExtraLarge.r,
                color: errorColor,
              ),
            ),
            SizedBox(height: AppDimensions.spacing16.h),
            Text(
              message ?? 'error.something_went_wrong'.tr(),
              textAlign: TextAlign.center,
              style: (isDark
                      ? AppTextStyles.darkBodyLarge
                      : AppTextStyles.lightBodyLarge)
                  .copyWith(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (onRetry != null) ...[
              SizedBox(height: AppDimensions.spacing24.h),
              SizedBox(
                width: 160.w,
                child: AppButton(
                  text: retryText ?? 'error.retry'.tr(),
                  icon: Icons.refresh_rounded,
                  onPressed: onRetry,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
