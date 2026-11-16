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
import 'package:universitys_gate/core/widgets/app_button.dart';
import 'package:universitys_gate/features/authentication/cubit/verify_otp/verify_otp_cubit.dart';
import 'package:universitys_gate/features/authentication/cubit/verify_otp/verify_otp_state.dart';

class VerifyOtpScreen extends StatelessWidget {
  static const String routeName = RouteNames.verifyOtp;

  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VerifyOtpCubit>(
      create: (context) => getIt<VerifyOtpCubit>(),
      child: _VerifyOtpScreenContent(),
    );
  }
}

class _VerifyOtpScreenContent extends StatefulWidget {
  _VerifyOtpScreenContent();

  @override
  State<_VerifyOtpScreenContent> createState() =>
      _VerifyOtpScreenContentState();
}

class _VerifyOtpScreenContentState extends State<_VerifyOtpScreenContent> {
  final List<TextEditingController> _otpControllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onVerify(BuildContext context, String email) {
    final code = _otpControllers.map((c) => c.text).join();
    if (code.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('validation.otp_required'.tr())),
      );
      return;
    }

    context.read<VerifyOtpCubit>().verifyOtp(
          email: email,
          otp: code,
        );
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
    final border = isDark ? DarkAppColors.border : AppColors.border;

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
      body: BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
        listener: (context, state) {
          if (state is VerifyOtpSuccess) {
            Navigator.pushNamed(
              context,
              RouteNames.resetPassword,
              arguments: emailArg,
            );
          } else if (state is VerifyOtpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is VerifyOtpLoading;

          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(AppDimensions.screenPadding.r),
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
                          color: primaryColor.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.mark_email_read_rounded,
                          size: 36.r,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimensions.spacing20.h),
                    Text(
                      'auth.verify_otp_title'.tr(),
                      style: (isDark
                              ? AppTextStyles.darkHeadlineLarge
                              : AppTextStyles.lightHeadlineLarge)
                          .copyWith(fontSize: 24.sp),
                    ),
                    SizedBox(height: AppDimensions.spacing8.h),
                    Text(
                      'auth.verify_otp_subtitle'.tr(),
                      style: (isDark
                              ? AppTextStyles.darkBodyMedium
                              : AppTextStyles.lightBodyMedium)
                          .copyWith(fontSize: 14.sp),
                    ),
                    SizedBox(height: AppDimensions.spacing24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(4, (index) {
                        return SizedBox(
                          width: 54.w,
                          height: 58.h,
                          child: TextField(
                            controller: _otpControllers[index],
                            focusNode: _focusNodes[index],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            maxLength: 1,
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              color: isDark
                                  ? DarkAppColors.textPrimary
                                  : AppColors.textPrimary,
                            ),
                            decoration: InputDecoration(
                              counterText: '',
                              filled: true,
                              fillColor: isDark
                                  ? Color(0xFF0F172A)
                                  : AppColors.surface,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(AppRadius.radius12.r),
                                borderSide: BorderSide(color: border),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(AppRadius.radius12.r),
                                borderSide:
                                    BorderSide(color: primaryColor, width: 2),
                              ),
                            ),
                            onChanged: (value) {
                              if (value.isNotEmpty && index < 3) {
                                _focusNodes[index + 1].requestFocus();
                              } else if (value.isEmpty && index > 0) {
                                _focusNodes[index - 1].requestFocus();
                              }
                            },
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: AppDimensions.spacing24.h),
                    AppButton(
                      text: 'auth.verify'.tr(),
                      isLoading: isLoading,
                      onPressed: () => _onVerify(context, emailArg),
                    ),
                    SizedBox(height: AppDimensions.spacing16.h),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('auth.code_resent_success'.tr()),
                            ),
                          );
                        },
                        child: Text(
                          'auth.resend_code'.tr(),
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
