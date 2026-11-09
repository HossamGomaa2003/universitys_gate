import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:universitys_gate/app/theme/app_colors.dart';
import 'package:universitys_gate/app/theme/app_text_styles.dart';

class LoginHeader extends StatelessWidget {
  final double screenWidth;

  const LoginHeader({
    super.key,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final primaryColor = isDark ? DarkAppColors.primary : AppColors.primary;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: EdgeInsets.only(
          left: 8,
          top: 12,
          bottom: 16,
        ),
        child: SizedBox(
          width: screenWidth * 0.48,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 60,
                    width: 60,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.school,
                          color: Colors.white,
                          size: 28,
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
                            letterSpacing: -0.5,
                          ),
                        ),
                        TextSpan(
                          text: 'Gate',
                          style: (isDark
                                  ? AppTextStyles.darkDisplayMedium
                                  : AppTextStyles.lightDisplayMedium)
                              .copyWith(
                            color: primaryColor,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14),
              Text(
                'auth.tagline'.tr(),
                style: (isDark
                        ? AppTextStyles.darkBodyMedium
                        : AppTextStyles.lightBodyMedium)
                    .copyWith(
                  fontSize: 14.5,
                  height: 1.35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
