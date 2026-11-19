import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:universitys_gate/core/utils/validators.dart';
import 'package:universitys_gate/core/widgets/app_text_field.dart';

class ConfirmPasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController originalPasswordController;
  final bool obscureText;
  final VoidCallback onToggleVisibility;

  const ConfirmPasswordTextField({
    super.key,
    required this.controller,
    required this.originalPasswordController,
    required this.obscureText,
    required this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      hint: 'auth.confirm_password'.tr(),
      hugePrefixIcon: HugeIcons.strokeRoundedLockPassword,
      hugeSuffixIcon: obscureText
          ? HugeIcons.strokeRoundedViewOffSlash
          : HugeIcons.strokeRoundedView,
      obscureText: obscureText,
      onSuffixIconPressed: onToggleVisibility,
      textInputAction: TextInputAction.done,
      validator: (val) => Validators.validateConfirmPassword(
        val,
        originalPasswordController.text,
      ),
    );
  }
}