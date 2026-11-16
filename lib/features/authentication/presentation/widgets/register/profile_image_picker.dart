import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universitys_gate/app/theme/app_colors.dart';

class ProfileImagePicker extends StatefulWidget {
  final ValueChanged<String?>? onImageSelected;

  const ProfileImagePicker({
    super.key,
    this.onImageSelected,
  });

  @override
  State<ProfileImagePicker> createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  static const String _prefsKey = 'selected_profile_avatar';

  String? _selectedAvatar;

  @override
  void initState() {
    super.initState();
    _loadSavedAvatar();
  }

  Future<void> _loadSavedAvatar() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_prefsKey);
    if (saved != null && mounted) {
      setState(() {
        _selectedAvatar = saved;
      });
      widget.onImageSelected?.call(saved);
    }
  }

  Future<void> _saveAvatar(String avatarPath) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, avatarPath);
    if (mounted) {
      setState(() {
        _selectedAvatar = avatarPath;
      });
      widget.onImageSelected?.call(avatarPath);
    }
  }

  ImageProvider? _getImageProvider(String? path) {
    if (path == null || path.isEmpty) return null;
    if (path.startsWith('assets/')) {
      return AssetImage(path);
    }
    return FileImage(File(path));
  }

  void _showPickerBottomSheet() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDark ? DarkAppColors.primary : AppColors.primary;
    final cardBg = isDark ? DarkAppColors.cardBackground : AppColors.surface;
    final border = isDark ? DarkAppColors.border : AppColors.border;

    showModalBottomSheet(
      context: context,
      backgroundColor: cardBg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Indicator Bar
              Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: border,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              SizedBox(height: 16.h),

              // Title translated (Arabic / English)
              Text(
                'auth.choose_profile_picture'.tr(),
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 28.h),

              // Action Options: Camera & Gallery
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Camera Option
                  _PickerOptionItem(
                    icon: Icons.camera_alt_rounded,
                    label: 'auth.camera'.tr(),
                    iconBgColor: primaryColor.withValues(alpha: 0.12),
                    iconColor: primaryColor,
                    onTap: () {
                      _saveAvatar('assets/images/logo.png');
                      Navigator.pop(context);
                    },
                  ),

                  // Gallery Option
                  _PickerOptionItem(
                    icon: Icons.photo_library_rounded,
                    label: 'auth.gallery'.tr(),
                    iconBgColor: (isDark ? DarkAppColors.secondary : AppColors.secondary).withValues(alpha: 0.12),
                    iconColor: isDark ? DarkAppColors.secondary : AppColors.secondary,
                    onTap: () {
                      _saveAvatar('assets/images/login.png');
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),

              SizedBox(height: 20.h),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDark ? DarkAppColors.primary : AppColors.primary;
    final backgroundColor = isDark ? DarkAppColors.surface : AppColors.background;

    return Center(
      child: GestureDetector(
        onTap: _showPickerBottomSheet,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Outer Ring Glow / Border
            Container(
              width: 92.r,
              height: 92.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    primaryColor,
                    primaryColor.withValues(alpha: 0.4),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withValues(alpha: 0.25),
                    blurRadius: 16.r,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: EdgeInsets.all(3.r),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: backgroundColor,
                ),
                child: CircleAvatar(
                  radius: 42.r,
                  backgroundColor: primaryColor.withValues(alpha: 0.1),
                  backgroundImage: _getImageProvider(_selectedAvatar),
                  child: _selectedAvatar == null
                      ? Icon(
                          Icons.person_rounded,
                          size: 48.r,
                          color: primaryColor,
                        )
                      : null,
                ),
              ),
            ),

            // Camera Badge Icon Button at Bottom Right
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 30.r,
                height: 30.r,
                decoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isDark ? DarkAppColors.cardBackground : Colors.white,
                    width: 2.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 6.r,
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.camera_alt_rounded,
                    size: 15.r,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PickerOptionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconBgColor;
  final Color iconColor;
  final VoidCallback onTap;

  const _PickerOptionItem({
    required this.icon,
    required this.label,
    required this.iconBgColor,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 58.r,
            height: 58.r,
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                icon,
                size: 28.r,
                color: iconColor,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: isDark ? DarkAppColors.textPrimary : AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}
