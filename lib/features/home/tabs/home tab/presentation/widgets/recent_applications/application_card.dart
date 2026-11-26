import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import 'package:universitys_gate/app/theme/app_colors.dart';

class ApplicationCard extends StatelessWidget {
  const ApplicationCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final primaryColor = isDark
        ? DarkAppColors.primary
        : AppColors.primary;

    final cardBgColor = isDark
        ? DarkAppColors.surface
        : Colors.white;

    final textColor = isDark
        ? DarkAppColors.textPrimary
        : AppColors.textPrimary;

    final textMutedColor = isDark
        ? DarkAppColors.textMuted
        : AppColors.textSecondary;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 14.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Status and University Icon
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Status Badge
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 5.h,
                ),
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF14532D)
                      : const Color(0xFFDCFCE7),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6.r,
                      height: 6.r,
                      decoration: const BoxDecoration(
                        color: Color(0xFF16A34A),
                        shape: BoxShape.circle,
                      ),
                    ),

                    SizedBox(width: 6.w),

                    Text(
                      'home.under_review'.tr(),
                      style: TextStyle(
                        color: isDark
                            ? const Color(0xFF86EFAC)
                            : const Color(0xFF16A34A),
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // University Icon
              Container(
                width: 48.r,
                height: 48.r,
                decoration: BoxDecoration(
                  color: primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Center(
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedUniversity,
                    color: primaryColor,
                    size: 26.r,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          // Application Information
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'home.cairo_university'.tr(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),

                    SizedBox(height: 4.h),

                    Text(
                      'home.faculty_computers'.tr(),
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: textMutedColor,
                      ),
                    ),

                    SizedBox(height: 10.h),

                    Row(
                      children: [
                        HugeIcon(
                          icon: HugeIcons.strokeRoundedCalendar01,
                          color: textMutedColor,
                          size: 14.r,
                        ),

                        SizedBox(width: 4.w),

                        Expanded(
                          child: Text(
                            'home.applied_date'.tr(),
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: textMutedColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}