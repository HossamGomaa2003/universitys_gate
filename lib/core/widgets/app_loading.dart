import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universitys_gate/app/theme/app_colors.dart';
import 'package:universitys_gate/app/theme/app_dimensions.dart';
import 'package:universitys_gate/app/theme/app_text_styles.dart';

class AppLoading extends StatelessWidget {
  final String? message;
  final double? strokeWidth;
  final double? size;
  final Color? color;

  const AppLoading({
    super.key,
    this.message,
    this.strokeWidth,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = color ?? (isDark ? DarkAppColors.primary : AppColors.primary);
    final indicatorSize = size ?? AppDimensions.iconLarge.r;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: indicatorSize,
            height: indicatorSize,
            child: CircularProgressIndicator(
              strokeWidth: strokeWidth ?? 3.0,
              color: primaryColor,
            ),
          ),
          if (message != null) ...[
            SizedBox(height: AppDimensions.spacing16.h),
            Text(
              message!,
              textAlign: TextAlign.center,
              style: (isDark
                      ? AppTextStyles.darkBodyMedium
                      : AppTextStyles.lightBodyMedium)
                  .copyWith(
                fontSize: 14.sp,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
