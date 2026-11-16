import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universitys_gate/app/router/route_names.dart';
import 'package:universitys_gate/app/theme/app_colors.dart';
import 'package:universitys_gate/app/theme/app_dimensions.dart';
import 'package:universitys_gate/app/theme/app_radius.dart';
import 'package:universitys_gate/app/theme/app_text_styles.dart';
import 'package:universitys_gate/core/di/injection.dart';
import 'package:universitys_gate/core/utils/validators.dart';
import 'package:universitys_gate/core/widgets/app_button.dart';
import 'package:universitys_gate/core/widgets/app_text_field.dart';
import 'package:universitys_gate/features/authentication/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:universitys_gate/features/authentication/cubit/forgot_password/forgot_password_state.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String routeName = RouteNames.forgotPassword;

  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgotPasswordCubit>(
      create: (context) => getIt<ForgotPasswordCubit>(),
      child: const _ForgotPasswordScreenContent(),
    );
  }
}

class _ForgotPasswordScreenContent extends StatefulWidget {
  const _ForgotPasswordScreenContent();

  @override
  State<_ForgotPasswordScreenContent> createState() =>
      _ForgotPasswordScreenContentState();
}

class _ForgotPasswordScreenContentState
    extends State<_ForgotPasswordScreenContent> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onSendCode(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<ForgotPasswordCubit>().sendOtp(
            email: _emailController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor =
        isDark ? DarkAppColors.background : AppColors.background;
    final cardBg = isDark ? DarkAppColors.cardBackground : AppColors.surface;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state is ForgotPasswordSuccess) {
            Navigator.pushNamed(
              context,
              RouteNames.verifyOtp,
              arguments: _emailController.text,
            );
          } else if (state is ForgotPasswordFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is ForgotPasswordLoading;

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
                        offset: Offset(0, 4),
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
                            color: (isDark
                                    ? DarkAppColors.primary
                                    : AppColors.primary)
                                .withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.lock_reset_rounded,
                            size: 36.r,
                            color: isDark
                                ? DarkAppColors.primary
                                : AppColors.primary,
                          ),
                        ),
                      ),
                      SizedBox(height: AppDimensions.spacing20.h),
                      Text(
                        'auth.forgot_password_title'.tr(),
                        style: (isDark
                                ? AppTextStyles.darkHeadlineLarge
                                : AppTextStyles.lightHeadlineLarge)
                            .copyWith(fontSize: 24.sp),
                      ),
                      SizedBox(height: AppDimensions.spacing8.h),
                      Text(
                        'auth.forgot_password_subtitle'.tr(),
                        style: (isDark
                                ? AppTextStyles.darkBodyMedium
                                : AppTextStyles.lightBodyMedium)
                            .copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(height: AppDimensions.spacing24.h),
                      AppTextField(
                        controller: _emailController,
                        hint: 'auth.email_address'.tr(),
                        prefixIcon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                        validator: Validators.validateEmail,
                      ),
                      SizedBox(height: AppDimensions.spacing24.h),
                      AppButton(
                        text: 'auth.send_code'.tr(),
                        suffixIcon: Icons.arrow_forward_rounded,
                        isLoading: isLoading,
                        onPressed: () => _onSendCode(context),
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
