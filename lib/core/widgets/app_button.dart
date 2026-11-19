import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_dimensions.dart';
import '../../app/theme/app_radius.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isOutlined;
  final IconData? icon;
  final IconData? suffixIcon;
  final List<List<dynamic>>? hugeIcon;
  final List<List<dynamic>>? hugeSuffixIcon;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isOutlined = false,
    this.icon,
    this.suffixIcon,
    this.hugeIcon,
    this.hugeSuffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color primaryColor = isDark ? DarkAppColors.primary : AppColors.primary;

    if (isOutlined) {
      return SizedBox(
        width: double.infinity,
        height: AppDimensions.buttonHeight.h,
        child: OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: primaryColor,
            side: BorderSide(
              color: primaryColor,
              width: 1.5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.button.r),
            ),
          ),
          child: _buildChild(primaryColor: primaryColor),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: AppDimensions.buttonHeight.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.button.r),
          ),
        ),
        child: _buildChild(primaryColor: Colors.white),
      ),
    );
  }

  Widget _buildChild({required Color primaryColor}) {
    if (isLoading) {
      return SizedBox(
        width: 22.r,
        height: 22.r,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          color: primaryColor,
        ),
      );
    }

    if (hugeSuffixIcon != null || suffixIcon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: AppDimensions.spacing8.w),
          if (hugeSuffixIcon != null)
            HugeIcon(
              icon: hugeSuffixIcon!,
              size: AppDimensions.iconMedium.r,
              color: primaryColor,
            )
          else
            Icon(
              suffixIcon,
              size: AppDimensions.iconMedium.r,
            ),
        ],
      );
    }

    if (hugeIcon != null || icon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (hugeIcon != null)
            HugeIcon(
              icon: hugeIcon!,
              size: AppDimensions.iconMedium.r,
              color: primaryColor,
            )
          else
            Icon(
              icon,
              size: AppDimensions.iconMedium.r,
            ),
          SizedBox(width: AppDimensions.spacing8.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    }

    return Text(
      text,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}