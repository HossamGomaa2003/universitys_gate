// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:universitys_gate/core/di/register_module.dart' as _i573;
import 'package:universitys_gate/core/network/dio_client.dart' as _i694;
import 'package:universitys_gate/core/services/ai_service.dart' as _i828;
import 'package:universitys_gate/core/services/notification_service.dart'
    as _i787;
import 'package:universitys_gate/core/services/storage_service.dart' as _i219;
import 'package:universitys_gate/core/storage/app_preferences.dart' as _i855;
import 'package:universitys_gate/features/app_setup/logic/app_setup_cubit.dart'
    as _i724;
import 'package:universitys_gate/features/authentication/cubit/login/login_cubit.dart'
    as _i1047;
import 'package:universitys_gate/features/authentication/data/repositories/auth_repository.dart'
    as _i358;
import 'package:universitys_gate/features/onboarding/cubit/onboarding_cubit.dart'
    as _i185;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i828.AiService>(() => _i828.AiService());
    gh.lazySingleton<_i787.NotificationService>(
      () => _i787.NotificationService(),
    );
    gh.lazySingleton<_i694.DioClient>(() => _i694.DioClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i855.AppPreferences>(
      () => _i855.AppPreferences(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i358.AuthRepository>(() => _i358.AuthRepositoryImpl());
    gh.factory<_i724.AppSetupCubit>(
      () => _i724.AppSetupCubit(gh<_i855.AppPreferences>()),
    );
    gh.factory<_i185.OnboardingCubit>(
      () => _i185.OnboardingCubit(gh<_i855.AppPreferences>()),
    );
    gh.lazySingleton<_i219.StorageService>(
      () => _i219.StorageService(gh<_i855.AppPreferences>()),
    );
    gh.factory<_i1047.LoginCubit>(
      () => _i1047.LoginCubit(gh<_i358.AuthRepository>()),
    );

    return this;
  }
}

class _$RegisterModule extends _i573.RegisterModule {}
