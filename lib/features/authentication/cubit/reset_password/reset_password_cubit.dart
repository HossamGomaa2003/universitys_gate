import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:universitys_gate/features/authentication/data/models/reset_password_request_model.dart';
import 'package:universitys_gate/features/authentication/data/repositories/auth_repository.dart';

import 'reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepository authRepository;

  ResetPasswordCubit(this.authRepository) : super(ResetPasswordInitial());

  Future<void> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
    required String confirmPassword,
  }) async {
    emit(ResetPasswordLoading());

    try {
      final request = ResetPasswordRequestModel(
        email: email.trim(),
        otp: otp.trim(),
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );
      await authRepository.resetPassword(request);
      emit(ResetPasswordSuccess());
    } catch (e) {
      emit(ResetPasswordFailure(
        e.toString().replaceFirst('Exception: ', ''),
      ));
    }
  }
}
