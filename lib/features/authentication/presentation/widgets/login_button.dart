import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:universitys_gate/core/widgets/app_button.dart';

class LoginButton extends StatelessWidget {
  final bool isRtl;
  final VoidCallback onPressed;

  const LoginButton({
    super.key,
    required this.isRtl,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: 'auth.login'.tr(),
      suffixIcon: isRtl
          ? Icons.arrow_back_rounded
          : Icons.arrow_forward_rounded,
      onPressed: onPressed,
    );
  }
}