import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:universitys_gate/features/authentication/data/models/verify_otp_request_model.dart';
import 'package:universitys_gate/features/authentication/data/repositories/auth_repository.dart';

import 'verify_otp_state.dart';

@injectable
class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final AuthRepository authRepository;

  VerifyOtpCubit(this.authRepository) : super(VerifyOtpInitial());

  Future<void> verifyOtp({
    required String email,
    required String otp,
  }) async {
    emit(VerifyOtpLoading());

    try {
      final request = VerifyOtpRequestModel(
        email: email.trim(),
        otp: otp.trim(),
      );
      await authRepository.verifyOtp(request);
      emit(VerifyOtpSuccess());
    } catch (e) {
      emit(VerifyOtpFailure(
        e.toString().replaceFirst('Exception: ', ''),
      ));
    }
  }
}
