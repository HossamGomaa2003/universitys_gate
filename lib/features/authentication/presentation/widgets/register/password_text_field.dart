import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:universitys_gate/core/utils/validators.dart';
import 'package:universitys_gate/core/widgets/app_text_field.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback onToggleVisibility;

  const PasswordTextField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      hint: 'auth.password'.tr(),
      hugePrefixIcon: HugeIcons.strokeRoundedLockKey,
      hugeSuffixIcon: obscureText
          ? HugeIcons.strokeRoundedViewOffSlash
          : HugeIcons.strokeRoundedView,
      obscureText: obscureText,
      onSuffixIconPressed: onToggleVisibility,
      textInputAction: TextInputAction.next,
      validator: Validators.validatePassword,
    );
  }
}