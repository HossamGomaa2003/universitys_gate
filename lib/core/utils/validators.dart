import 'package:easy_localization/easy_localization.dart';

class Validators {
  Validators._();

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'validation.name_required'.tr();
    }
    if (value.trim().length < 3) {
      return 'validation.name_too_short'.tr();
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'validation.email_required'.tr();
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'validation.email_invalid'.tr();
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'validation.phone_required'.tr();
    }
    if (value.trim().length < 8) {
      return 'validation.phone_invalid'.tr();
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'validation.password_required'.tr();
    }
    if (value.length < 6) {
      return 'validation.password_too_short'.tr();
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'validation.confirm_password_required'.tr();
    }
    if (value != password) {
      return 'validation.passwords_do_not_match'.tr();
    }
    return null;
  }
}
