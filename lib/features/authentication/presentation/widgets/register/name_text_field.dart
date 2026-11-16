import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:universitys_gate/core/utils/validators.dart';
import 'package:universitys_gate/core/widgets/app_text_field.dart';

class NameTextField extends StatelessWidget {
  final TextEditingController controller;

  const NameTextField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      hint: 'auth.full_name'.tr(),
      prefixIcon: Icons.person_outline_rounded,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      validator: Validators.validateName,
    );
  }
}
