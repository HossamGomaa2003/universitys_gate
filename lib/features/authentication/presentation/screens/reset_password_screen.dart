import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:universitys_gate/app/router/route_names.dart';
import 'package:universitys_gate/app/theme/app_colors.dart';
import 'package:universitys_gate/app/theme/app_dimensions.dart';
import 'package:universitys_gate/app/theme/app_radius.dart';
import 'package:universitys_gate/app/theme/app_text_styles.dart';
import 'package:universitys_gate/core/di/injection.dart';
import 'package:universitys_gate/core/utils/validators.dart';
import 'package:universitys_gate/core/widgets/app_button.dart';
import 'package:universitys_gate/core/widgets/app_text_field.dart';
import 'package:universitys_gate/features/authentication/cubit/reset_password/reset_password_cubit.dart';
import 'package:universitys_gate/features/authentication/cubit/reset_password/reset_password_state.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const String routeName = RouteNames.resetPassword;

  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResetPasswordCubit>(
      create: (context) => getIt<ResetPasswordCubit>(),
      child: const _ResetPasswordScreenContent(),
    );
  }
}

class _ResetPasswordScreenContent extends StatefulWidget {
  const _ResetPasswordScreenContent();

  @override
  State<_ResetPasswordScreenContent> createState() =>
      _ResetPasswordScreenContentState();
}

class _ResetPasswordScreenContentState
    extends State<_ResetPasswordScreenContent> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSavePassword(BuildContext context, String email) {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<ResetPasswordCubit>().resetPassword(
        email: email,
        otp: '1234',
        newPassword: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final emailArg =
        ModalRoute.of(context)?.settings.arguments as String? ?? '';

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor =
    isDark ? DarkAppColors.background : AppColors.background;
    final cardBg = isDark ? DarkAppColors.cardBackground : AppColors.surface;
    final primaryColor = isDark ? DarkAppColors.primary : AppColors.primary;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedArrowLeft01,
            color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
            size: 22.r,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('auth.reset_password_success'.tr()),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteNames.login,
                  (route) => false,
            );
          } else if (state is ResetPasswordFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is ResetPasswordLoading;

          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(AppDimensions.screenPadding.r),
              child: Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.all(AppDimensions.screenPaddingLarge.r),
                  decoration: BoxDecoration(
                    color: cardBg,
                    borderRadius: BorderRadius.circular(AppRadius.card.r),
                    boxShadow: [
                      BoxShadow(
                        color: isDark
                            ? Colors.black.withValues(alpha: 0.2)
                            : AppColors.primaryDark.withValues(alpha: 0.05),
                        blurRadius: 20.r,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 72.r,
                          height: 72.r,
                          decoration: BoxDecoration(
                            color: primaryColor.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: HugeIcon(
                              icon: HugeIcons.strokeRoundedKey01,
                              size: 36.r,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: AppDimensions.spacing20.h),
                      Text(
                        'auth.reset_password_title'.tr(),
                        style: (isDark
                            ? AppTextStyles.darkHeadlineLarge
                            : AppTextStyles.lightHeadlineLarge)
                            .copyWith(fontSize: 24.sp),
                      ),
                      SizedBox(height: AppDimensions.spacing8.h),
                      Text(
                        'auth.reset_password_subtitle'.tr(),
                        style: (isDark
                            ? AppTextStyles.darkBodyMedium
                            : AppTextStyles.lightBodyMedium)
                            .copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(height: AppDimensions.spacing24.h),
                      AppTextField(
                        controller: _passwordController,
                        hint: 'auth.new_password'.tr(),
                        hugePrefixIcon: HugeIcons.strokeRoundedLockKey,
                        hugeSuffixIcon: _obscurePassword
                            ? HugeIcons.strokeRoundedViewOffSlash
                            : HugeIcons.strokeRoundedView,
                        obscureText: _obscurePassword,
                        onSuffixIconPressed: () {
                          setState(() => _obscurePassword = !_obscurePassword);
                        },
                        validator: Validators.validatePassword,
                      ),
                      SizedBox(height: AppDimensions.spacing16.h),
                      AppTextField(
                        controller: _confirmPasswordController,
                        hint: 'auth.confirm_password'.tr(),
                        hugePrefixIcon: HugeIcons.strokeRoundedLockPassword,
                        hugeSuffixIcon: _obscureConfirmPassword
                            ? HugeIcons.strokeRoundedViewOffSlash
                            : HugeIcons.strokeRoundedView,
                        obscureText: _obscureConfirmPassword,
                        onSuffixIconPressed: () {
                          setState(
                                () => _obscureConfirmPassword =
                            !_obscureConfirmPassword,
                          );
                        },
                        validator: (val) => Validators.validateConfirmPassword(
                          val,
                          _passwordController.text,
                        ),
                      ),
                      SizedBox(height: AppDimensions.spacing24.h),
                      AppButton(
                        text: 'auth.save_password'.tr(),
                        hugeSuffixIcon: HugeIcons.strokeRoundedArrowRight01,
                        isLoading: isLoading,
                        onPressed: () => _onSavePassword(context, emailArg),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}