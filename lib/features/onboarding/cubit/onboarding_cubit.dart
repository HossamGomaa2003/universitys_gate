import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:universitys_gate/core/storage/app_preferences.dart';

import 'onboarding_state.dart';

@injectable
class OnboardingCubit extends Cubit<OnboardingState> {
  final AppPreferences _preferences;

  OnboardingCubit(this._preferences) : super(const OnboardingState());

  void changePage(int index) {
    emit(state.copyWith(currentPage: index));
  }

  Future<void> completeOnboarding() async {
    await _preferences.setSetupComplete(true);

    emit(state.copyWith(isCompleted: true));
  }
}
