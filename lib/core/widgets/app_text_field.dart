import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_dimensions.dart';
import '../../app/theme/app_radius.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? errorText;
  final FormFieldValidator<String>? validator;

  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  final bool obscureText;
  final bool enabled;
  final bool readOnly;

  final IconData? prefixIcon;
  final IconData? suffixIcon;

  final List<List<dynamic>>? hugePrefixIcon;
  final List<List<dynamic>>? hugeSuffixIcon;

  final VoidCallback? onSuffixIconPressed;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;

  const AppTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.errorText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.hugePrefixIcon,
    this.hugeSuffixIcon,
    this.onSuffixIconPressed,
    this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    final Color iconColor = isDark ? DarkAppColors.textSecondary : AppColors.textSecondary;
    final Color borderColor = isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0);
    final Color primaryColor = isDark ? DarkAppColors.primary : AppColors.primary;

    Widget? buildPrefixIcon() {
      if (hugePrefixIcon != null) {
        return UnconstrainedBox(
          child: HugeIcon(
            icon: hugePrefixIcon!,
            color: iconColor,
            size: 20,
          ),
        );
      }
      if (prefixIcon != null) {
        return Icon(prefixIcon, color: iconColor);
      }
      return null;
    }

    Widget? buildSuffixIcon() {
      if (hugeSuffixIcon != null) {
        return IconButton(
          onPressed: onSuffixIconPressed,
          icon: HugeIcon(
            icon: hugeSuffixIcon!,
            color: iconColor,
            size: 20,
          ),
        );
      }
      if (suffixIcon != null) {
        return IconButton(
          onPressed: onSuffixIconPressed,
          icon: Icon(suffixIcon, color: iconColor),
        );
      }
      return null;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppDimensions.spacing8),
        ],

        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          obscureText: obscureText,
          enabled: enabled,
          readOnly: readOnly,
          validator: validator,
          onChanged: onChanged,
          onTap: onTap,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8),
              fontSize: 14,
            ),
            errorText: errorText,
            prefixIcon: buildPrefixIcon(),
            suffixIcon: buildSuffixIcon(),
            filled: true,
            fillColor: isDark ? const Color(0xFF0F172A) : theme.colorScheme.surface,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spacing16,
              vertical: AppDimensions.spacing16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.textField),
              borderSide: BorderSide(color: borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.textField),
              borderSide: BorderSide(color: borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.textField),
              borderSide: BorderSide(color: primaryColor, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.textField),
              borderSide: const BorderSide(color: AppColors.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.textField),
              borderSide: const BorderSide(color: AppColors.error, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}