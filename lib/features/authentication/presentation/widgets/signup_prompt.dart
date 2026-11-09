import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:universitys_gate/app/theme/app_colors.dart';
import 'package:universitys_gate/app/theme/app_text_styles.dart';

class SignupPrompt extends StatelessWidget {
  final VoidCallback onTap;

  const SignupPrompt({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    final primaryColor = isDark
        ? DarkAppColors.primary
        : AppColors.primary;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'auth.dont_have_account'.tr(),
          style: (isDark
                  ? AppTextStyles.darkBodyMedium
                  : AppTextStyles.lightBodyMedium)
              .copyWith(
            fontSize: 13.5,
          ),
        ),

        GestureDetector(
          onTap: onTap,
          child: Text(
            'auth.create_account'.tr(),
            style: (isDark
                    ? AppTextStyles.darkBodyMedium
                    : AppTextStyles.lightBodyMedium)
                .copyWith(
              fontSize: 13.5,
              color: primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}