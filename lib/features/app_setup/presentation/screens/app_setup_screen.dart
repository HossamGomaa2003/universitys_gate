import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universitys_gate/app/router/route_names.dart';
import 'package:universitys_gate/core/storage/app_preferences.dart';
import 'package:universitys_gate/features/app_setup/logic/app_setup_cubit.dart';
import 'package:universitys_gate/features/app_setup/logic/app_setup_state.dart';
import 'package:universitys_gate/features/app_setup/presentation/widgets/language_selector.dart';
import 'package:universitys_gate/features/app_setup/presentation/widgets/setup_header.dart';
import 'package:universitys_gate/features/app_setup/presentation/widgets/theme_selector.dart';


class AppSetupScreen extends StatefulWidget {
  static const String routeName = RouteNames.appSetup;

  const AppSetupScreen({super.key});

  @override
  State<AppSetupScreen> createState() => _AppSetupScreenState();
}

class _AppSetupScreenState extends State<AppSetupScreen> {
  String _selectedLanguage = 'en';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedLanguage = context.locale.languageCode;
  }

  Future<void> _changeLanguage(String languageCode) async {
    if (_selectedLanguage == languageCode) return;

    setState(() {
      _selectedLanguage = languageCode;
    });

    await context.setLocale(Locale(languageCode));
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color scaffoldBg = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      backgroundColor: scaffoldBg,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colorScheme.surface,
              scaffoldBg,
              colorScheme.secondary.withValues(alpha: 0.1),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 24.h,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 500.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 12.h),

                    SetupHeader(),

                    SizedBox(height: 32.h),

                    LanguageSelector(
                      selectedLanguage: _selectedLanguage,
                      onLanguageChanged: _changeLanguage,
                    ),

                    SizedBox(height: 28.h),

                    BlocBuilder<AppSetupCubit, AppSetupState>(
                      builder: (context, state) {
                        return ThemeSelector(
                          selectedTheme: state.themeMode,
                          onThemeChanged: context
                              .read<AppSetupCubit>()
                              .changeTheme,
                        );
                      },
                    ),

                    SizedBox(height: 40.h),

                    SizedBox(
                      width: double.infinity,
                      height: 56.h,
                      child: ElevatedButton(
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          await AppPreferences(prefs).setSetupComplete(true);

                          if (context.mounted) {
                            Navigator.pushReplacementNamed(
                              context,
                              RouteNames.onboarding,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          foregroundColor: colorScheme.onPrimary,
                          elevation: 2,
                          shadowColor: colorScheme.primary.withValues(alpha: 0.4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'continue'.tr(),
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Icon(
                              context.locale.languageCode == 'ar'
                                  ? Icons.arrow_back_rounded
                                  : Icons.arrow_forward_rounded,
                              size: 20.r,
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
