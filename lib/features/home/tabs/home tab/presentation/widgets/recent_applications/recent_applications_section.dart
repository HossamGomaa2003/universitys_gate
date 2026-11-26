import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import 'package:universitys_gate/app/router/route_names.dart';
import 'package:universitys_gate/app/theme/app_colors.dart';

import 'application_card.dart';

class RecentApplicationsSection extends StatelessWidget {
  const RecentApplicationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final isRtl = context.locale.languageCode == 'ar';

    final primaryColor = isDark
        ? DarkAppColors.primary
        : AppColors.primary;

    final textColor = isDark
        ? DarkAppColors.textPrimary
        : AppColors.textPrimary;

    return Column(
      children: [
        // Section Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                HugeIcon(
                  icon: HugeIcons.strokeRoundedClock01,
                  color: primaryColor,
                  size: 22.r,
                ),

                SizedBox(width: 6.w),

                Text(
                  'home.recent_applications'.tr(),
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ],
            ),

            // View All
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteNames.myApplications,
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 6.h,
                ),
                decoration: BoxDecoration(
                  color: primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  children: [
                    Text(
                      'home.view_all'.tr(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                      ),
                    ),

                    SizedBox(width: 4.w),

                    HugeIcon(
                      icon: isRtl
                          ? HugeIcons.strokeRoundedArrowLeft01
                          : HugeIcons.strokeRoundedArrowRight01,
                      color: primaryColor,
                      size: 14.r,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 14.h),

        const ApplicationCard(),
      ],
    );
  }
}