import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universitys_gate/app/theme/app_colors.dart';
import 'package:universitys_gate/app/theme/app_text_styles.dart';

class TermsCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final VoidCallback? onTermsTap;
  final VoidCallback? onPrivacyTap;

  const TermsCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.onTermsTap,
    this.onPrivacyTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDark ? DarkAppColors.primary : AppColors.primary;
    final textDark = isDark ? DarkAppColors.textDark : AppColors.textDark;
    final checkboxBorder = isDark ? DarkAppColors.checkboxBorder : AppColors.checkboxBorder;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 22.r,
          height: 22.r,
          child: Checkbox(
            value: value,
            activeColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
            side: BorderSide(
              color: checkboxBorder,
              width: 1.5,
            ),
            onChanged: (newValue) {
              onChanged(newValue ?? false);
            },
          ),
        ),

        SizedBox(width: 10.w),

        Expanded(
          child: RichText(
            text: TextSpan(
              style: (isDark
                      ? AppTextStyles.darkBodyMedium
                      : AppTextStyles.lightBodyMedium)
                  .copyWith(
                fontSize: 13.sp,
                color: textDark,
              ),
              children: [
                TextSpan(text: 'auth.agree_terms_prefix'.tr()),
                TextSpan(
                  text: 'auth.terms_conditions'.tr(),
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = onTermsTap,
                ),
                TextSpan(text: 'auth.and'.tr()),
                TextSpan(
                  text: 'auth.privacy_policy'.tr(),
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = onPrivacyTap,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
