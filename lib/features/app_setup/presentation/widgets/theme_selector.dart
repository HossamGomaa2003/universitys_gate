import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universitys_gate/app/theme/app_colors.dart';


class ThemeSelector extends StatelessWidget {
  const ThemeSelector({
    super.key,
    required this.selectedTheme,
    required this.onThemeChanged,
  });

  final ThemeMode selectedTheme;
  final ValueChanged<ThemeMode> onThemeChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'theme_title'.tr(),
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _ThemeOption(
                title: 'theme_light'.tr(),
                icon: Icons.light_mode_outlined,
                selected: selectedTheme == ThemeMode.light,
                onTap: () => onThemeChanged(ThemeMode.light),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: _ThemeOption(
                title: 'theme_dark'.tr(),
                icon: Icons.dark_mode_outlined,
                selected: selectedTheme == ThemeMode.dark,
                onTap: () => onThemeChanged(ThemeMode.dark),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: _ThemeOption(
                title: 'theme_system'.tr(),
                icon: Icons.settings_brightness_outlined,
                selected: selectedTheme == ThemeMode.system,
                onTap: () => onThemeChanged(ThemeMode.system),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ThemeOption extends StatelessWidget {
  const _ThemeOption({
    required this.title,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 14.h,
            horizontal: 4.w,
          ),
          decoration: BoxDecoration(
            color: selected
                ? AppColors.primary.withValues(alpha: 0.25)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: selected
                  ? AppColors.primary
                  : Theme.of(context).dividerColor.withValues(alpha: 0.6),
              width: selected ? 1.5 : 1,
            ),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: selected
                    ? AppColors.primary
                    : Theme.of(context).iconTheme.color,
                size: 24.r,
              ),
              SizedBox(height: 12.h),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: selected
                      ? FontWeight.w600
                      : FontWeight.normal,
                  color: selected
                      ? AppColors.primary
                      : Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
