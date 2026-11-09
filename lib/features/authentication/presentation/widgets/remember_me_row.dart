import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:universitys_gate/app/theme/app_colors.dart';
import 'package:universitys_gate/app/theme/app_text_styles.dart';

class RememberMeRow extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final VoidCallback onForgotPassword;

  const RememberMeRow({
    super.key,
    required this.value,
    required this.onChanged,
    required this.onForgotPassword,
  });

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    final primaryColor = isDark
        ? DarkAppColors.primary
        : AppColors.primary;

    final textDark = isDark
        ? DarkAppColors.textDark
        : AppColors.textDark;

    final checkboxBorder = isDark
        ? DarkAppColors.checkboxBorder
        : AppColors.checkboxBorder;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 22,
              height: 22,
              child: Checkbox(
                value: value,
                activeColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
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

            SizedBox(width: 8),

            GestureDetector(
              onTap: () => onChanged(!value),
              child: Text(
                'auth.remember_me'.tr(),
                style: (isDark
                        ? AppTextStyles.darkBodyMedium
                        : AppTextStyles.lightBodyMedium)
                    .copyWith(
                  fontSize: 13.5,
                  color: textDark,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),

        GestureDetector(
          onTap: onForgotPassword,
          child: Text(
            'auth.forgot_password'.tr(),
            style: (isDark
                    ? AppTextStyles.darkBodyMedium
                    : AppTextStyles.lightBodyMedium)
                .copyWith(
              fontSize: 13.5,
              color: primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}