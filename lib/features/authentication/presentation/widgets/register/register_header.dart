import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universitys_gate/app/theme/app_colors.dart';
import 'package:universitys_gate/app/theme/app_text_styles.dart';

class RegisterHeader extends StatelessWidget {
  final double screenWidth;
  final VoidCallback onBackPressed;

  const RegisterHeader({
    super.key,
    required this.screenWidth,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDark ? DarkAppColors.primary : AppColors.primary;
    final cardBg = isDark ? DarkAppColors.surface : AppColors.surface;
    final border = isDark ? DarkAppColors.border : AppColors.border;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: EdgeInsets.only(
          left: 4.w,
          top: 8.h,
          bottom: 12.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back button
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onBackPressed,
                borderRadius: BorderRadius.circular(50.r),
                child: Container(
                  width: 42.r,
                  height: 42.r,
                  decoration: BoxDecoration(
                    color: cardBg,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: border,
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 8.r,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 18.r,
                      color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 16.h),

            // Logo & Tagline Column
            SizedBox(
              width: screenWidth * 0.52,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 56.r,
                        width: 56.r,
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
                              style: (isDark
                                      ? AppTextStyles.darkDisplayMedium
                                      : AppTextStyles.lightDisplayMedium)
                                  .copyWith(
                                fontSize: 28.sp,
                                letterSpacing: -0.5,
                              ),
                            ),
                            TextSpan(
                              text: 'Gate',
                              style: (isDark
                                      ? AppTextStyles.darkDisplayMedium
                                      : AppTextStyles.lightDisplayMedium)
                                  .copyWith(
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
                  SizedBox(height: 10.h),
                  Text(
                    'auth.tagline'.tr(),
                    style: (isDark
                            ? AppTextStyles.darkBodyMedium
                            : AppTextStyles.lightBodyMedium)
                        .copyWith(
                      fontSize: 14.sp,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
