import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universitys_gate/app/theme/app_colors.dart';


class SetupHeader extends StatelessWidget {
  const SetupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'assets/images/logo.png',
            width: 72.w,
            height: 72.w,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: 20.h),
        Text(
          'setup_title'.tr(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26.sp,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'setup_subtitle'.tr(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            color: Theme.of(context).textTheme.bodySmall?.color ?? Colors.grey,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
