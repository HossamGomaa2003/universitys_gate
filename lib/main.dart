import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/router/app_router.dart';
import 'app/router/route_names.dart';
import 'app/theme/app_theme.dart';
import 'core/storage/app_preferences.dart';
import 'features/app_setup/logic/app_setup_cubit.dart';
import 'features/app_setup/logic/app_setup_state.dart';

Future<void> main() async {
  // Initialize Flutter bindings
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Easy Localization
  await EasyLocalization.ensureInitialized();

  // Initialize SharedPreferences and AppPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  final appPreferences = AppPreferences(sharedPreferences);
  final appSetupCubit = AppSetupCubit(appPreferences);

  // Run the application
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: BlocProvider.value(
        value: appSetupCubit,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocBuilder<AppSetupCubit, AppSetupState>(
          builder: (context, state) {
            return MaterialApp(
              // General Settings
              debugShowCheckedModeBanner: false,

              // Theme Settings
              theme: MyThemeData.lightTheme,
              darkTheme: MyThemeData.darkTheme,
              themeMode: state.themeMode,

              // Easy Localization Settings
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,

              // Navigation Settings
              initialRoute: RouteNames.splash,
              onGenerateRoute: AppRouter.onGenerateRoute,
            );
          },
        );
      },
    );
  }
}
