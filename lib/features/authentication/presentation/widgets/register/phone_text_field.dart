import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:universitys_gate/core/utils/validators.dart';
import 'package:universitys_gate/core/widgets/app_text_field.dart';

class PhoneTextField extends StatelessWidget {
  final TextEditingController controller;

  const PhoneTextField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      hint: 'auth.phone_number'.tr(),
      prefixIcon: Icons.phone_outlined,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      validator: Validators.validatePhone,
    );
  }
}
