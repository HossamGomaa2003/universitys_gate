import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:universitys_gate/app/theme/app_text_styles.dart';


class OnboardingPages {
  final BuildContext? context;

  const OnboardingPages([this.context]);

  List<PageViewModel> get listPagesViewModel {
    final bool isDark = context != null && Theme.of(context!).brightness == Brightness.dark;
    final TextStyle titleStyle = isDark ? AppTextStyles.darkDisplayLarge : AppTextStyles.lightDisplayLarge;
    final TextStyle bodyStyle = isDark ? AppTextStyles.darkBodyMedium : AppTextStyles.lightBodyMedium;

    return [
      PageViewModel(
        titleWidget: Transform.translate(
          offset: Offset(0, 70.h),
          child: Text(
            "onboarding.title_1".tr(),
            style: titleStyle,
            textAlign: TextAlign.center,
          ),
        ),
        bodyWidget: Transform.translate(
          offset: Offset(0, 70.h),
          child: Text(
            "onboarding.description_1".tr(),
            style: bodyStyle,
            textAlign: TextAlign.center,
          ),
        ),
        image: Transform.translate(
          offset: Offset(0, 140.h),
          child: Image.asset(
            "assets/images/onboarding_1.png",
            width: 500.w,
            height: 500.h,
            fit: BoxFit.contain,
          ),
        ),
      ),
      PageViewModel(
        titleWidget: Transform.translate(
          offset: Offset(0, 70.h),
          child: Text(
            "onboarding.title_2".tr(),
            style: titleStyle,
            textAlign: TextAlign.center,
          ),
        ),
        bodyWidget: Transform.translate(
          offset: Offset(0, 70.h),
          child: Text(
            "onboarding.description_2".tr(),
            style: bodyStyle,
            textAlign: TextAlign.center,
          ),
        ),
        image: Transform.translate(
          offset: Offset(0, 140.h),
          child: Image.asset(
            "assets/images/onboarding_2.png",
            width: 500.w,
            height: 500.h,
            fit: BoxFit.contain,
          ),
        ),
      ),
      PageViewModel(
        titleWidget: Transform.translate(
          offset: Offset(0, 70.h),
          child: Text(
            "onboarding.title_3".tr(),
            style: titleStyle,
            textAlign: TextAlign.center,
          ),
        ),
        bodyWidget: Transform.translate(
          offset: Offset(0, 70.h),
          child: Text(
            "onboarding.description_3".tr(),
            style: bodyStyle,
            textAlign: TextAlign.center,
          ),
        ),
        image: Transform.translate(
          offset: Offset(0, 140.h),
          child: Image.asset(
            "assets/images/onboarding_3.png",
            width: 500.w,
            height: 500.h,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ];
  }
}
