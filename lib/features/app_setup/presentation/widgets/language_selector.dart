import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universitys_gate/app/theme/app_colors.dart';



class LanguageSelector extends StatelessWidget {
  const LanguageSelector({
    super.key,
    required this.selectedLanguage,
    required this.onLanguageChanged,
  });

  final String selectedLanguage;
  final ValueChanged<String> onLanguageChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'language_title'.tr(),
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 12.h),
        _LanguageOption(
          title: 'language_english'.tr(),
          subtitle: 'language_english_subtitle'.tr(),
          flag: '🇬🇧',
          languageCode: 'en',
          selectedLanguage: selectedLanguage,
          onTap: () => onLanguageChanged('en'),
        ),
        SizedBox(height: 12.h),
        _LanguageOption(
          title: 'language_arabic'.tr(),
          subtitle: 'language_arabic_subtitle'.tr(),
          flag: '🇪🇬',
          languageCode: 'ar',
          selectedLanguage: selectedLanguage,
          onTap: () => onLanguageChanged('ar'),
        ),
      ],
    );
  }
}

class _LanguageOption extends StatelessWidget {
  const _LanguageOption({
    required this.title,
    required this.subtitle,
    required this.flag,
    required this.languageCode,
    required this.selectedLanguage,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String flag;
  final String languageCode;
  final String selectedLanguage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedLanguage == languageCode;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primary.withValues(alpha: 0.25)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: isSelected
                  ? AppColors.primary
                  : Theme.of(context).dividerColor.withValues(alpha: 0.6),
              width: isSelected ? 1.5 : 1,
            ),
          ),
          child: Row(
            children: [
              Text(
                flag,
                style: TextStyle(fontSize: 28.sp),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              if (isSelected)
                Icon(
                  Icons.check_circle,
                  color: AppColors.primary,
                  size: 22.r,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
