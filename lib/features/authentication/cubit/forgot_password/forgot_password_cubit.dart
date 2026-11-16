import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:universitys_gate/features/authentication/data/models/forgot_password_request_model.dart';
import 'package:universitys_gate/features/authentication/data/repositories/auth_repository.dart';

import 'forgot_password_state.dart';

@injectable
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepository authRepository;

  ForgotPasswordCubit(this.authRepository) : super(ForgotPasswordInitial());

  Future<void> sendOtp({required String email}) async {
    emit(ForgotPasswordLoading());

    try {
      final request = ForgotPasswordRequestModel(email: email.trim());
      await authRepository.forgotPassword(request);
      emit(ForgotPasswordSuccess());
    } catch (e) {
      emit(ForgotPasswordFailure(
        e.toString().replaceFirst('Exception: ', ''),
      ));
    }
  }
}
