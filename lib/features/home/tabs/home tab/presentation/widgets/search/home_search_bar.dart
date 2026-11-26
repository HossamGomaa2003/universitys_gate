import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import 'package:universitys_gate/app/theme/app_colors.dart';
import 'package:universitys_gate/features/home/tabs/home%20tab/cubit/home_cubit.dart';

class HomeSearchBar extends StatefulWidget {
  final TextEditingController controller;

  const HomeSearchBar({
    super.key,
    required this.controller,
  });

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  bool _hasText = false;
  bool _isFocused = false;

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _hasText = widget.controller.text.isNotEmpty;

    widget.controller.addListener(_onTextChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  void _onTextChanged() {
    final hasText = widget.controller.text.isNotEmpty;

    if (_hasText != hasText) {
      setState(() {
        _hasText = hasText;
      });
    }
  }

  void _onFocusChanged() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    final cardColor = isDark
        ? DarkAppColors.surface
        : Colors.white;

    final textColor = isDark
        ? DarkAppColors.textPrimary
        : AppColors.textPrimary;

    final mutedColor = isDark
        ? DarkAppColors.textMuted
        : AppColors.textSecondary;

    final borderColor = _isFocused
        ? (isDark
        ? DarkAppColors.primary
        : AppColors.primary)
        : (isDark
        ? Colors.white.withValues(alpha: 0.08)
        : const Color(0xFFE8EDF5));

    final iconBackground = isDark
        ? DarkAppColors.primary.withValues(alpha: 0.16)
        : AppColors.primary.withValues(alpha: 0.09);

    final iconColor = isDark
        ? DarkAppColors.primary
        : AppColors.primary;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 62.h,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: borderColor,
          width: _isFocused ? 1.4 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: isDark ? 0.08 : 0.035,
            ),
            blurRadius: 16.r,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: 12.w),

          // Search Icon
          Container(
            width: 40.r,
            height: 40.r,
            decoration: BoxDecoration(
              color: iconBackground,
              borderRadius: BorderRadius.circular(13.r),
            ),
            child: Center(
              child: HugeIcon(
                icon: HugeIcons.strokeRoundedSearch01,
                color: iconColor,
                size: 21.r,
              ),
            ),
          ),

          SizedBox(width: 12.w),

          // Search Field
          Expanded(
            child: TextField(
              controller: widget.controller,
              focusNode: _focusNode,

              onChanged: (value) {
                context.read<HomeCubit>().updateSearchQuery(value);
              },

              textInputAction: TextInputAction.search,

              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),

              decoration: InputDecoration(
                hintText: 'home.search_hint'.tr(),
                hintStyle: TextStyle(
                  color: mutedColor,
                  fontSize: 12.5.sp,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                isCollapsed: true,
              ),
            ),
          ),

          // Clear Button
          if (_hasText)
            IconButton(
              onPressed: () {
                widget.controller.clear();

                context.read<HomeCubit>().clearSearch();

                _focusNode.requestFocus();
              },
              splashRadius: 20.r,
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedCancel01,
                color: mutedColor,
                size: 19.r,
              ),
            ),

          SizedBox(width: 8.w),
        ],
      ),
    );
  }
}