import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:universitys_gate/core/widgets/app_button.dart';

class RegisterButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const RegisterButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: 'auth.create_account_title'.tr(),
      hugeSuffixIcon: HugeIcons.strokeRoundedArrowRight01,
      isLoading: isLoading,
      onPressed: onPressed,
    );
  }
}