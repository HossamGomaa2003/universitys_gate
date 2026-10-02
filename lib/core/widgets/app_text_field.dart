import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_dimensions.dart';
import '../../app/theme/app_radius.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? errorText;

  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  final bool obscureText;
  final bool enabled;
  final bool readOnly;

  final IconData? prefixIcon;
  final IconData? suffixIcon;

  final VoidCallback? onSuffixIconPressed;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;

  const AppTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.errorText,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
          const SizedBox(
            height: AppDimensions.spacing8,
          ),
        ],

        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          obscureText: obscureText,
          enabled: enabled,
          readOnly: readOnly,
          onChanged: onChanged,
          onTap: onTap,

          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurface,
          ),

          decoration: InputDecoration(
            hintText: hint,
            errorText: errorText,

            prefixIcon: prefixIcon != null
                ? Icon(
              prefixIcon,
              color: AppColors.textSecondary,
            )
                : null,

            suffixIcon: suffixIcon != null
                ? IconButton(
              onPressed: onSuffixIconPressed,
              icon: Icon(
                suffixIcon,
                color: AppColors.textSecondary,
              ),
            )
                : null,

            filled: true,
            fillColor: theme.colorScheme.surface,

            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spacing16,
              vertical: AppDimensions.spacing16,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppRadius.textField,
              ),
              borderSide: BorderSide(
                color: theme.dividerColor,
              ),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppRadius.textField,
              ),
              borderSide: BorderSide(
                color: theme.dividerColor,
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppRadius.textField,
              ),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 2,
              ),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppRadius.textField,
              ),
              borderSide: const BorderSide(
                color: AppColors.error,
              ),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppRadius.textField,
              ),
              borderSide: const BorderSide(
                color: AppColors.error,
                width: 2,
              ),
            ),

            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppRadius.textField,
              ),
              borderSide: BorderSide(
                color: theme.disabledColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}