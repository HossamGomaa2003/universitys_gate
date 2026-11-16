import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:universitys_gate/features/authentication/data/models/register_request_model.dart';
import 'package:universitys_gate/features/authentication/data/repositories/auth_repository.dart';

import 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository authRepository;

  RegisterCubit(this.authRepository) : super(RegisterInitial());

  Future<void> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
    String? profileImage,
  }) async {
    emit(RegisterLoading());

    try {
      final request = RegisterRequestModel(
        name: name.trim(),
        email: email.trim(),
        phone: phone.trim(),
        password: password,
        confirmPassword: confirmPassword,
        profileImage: profileImage,
      );

      await authRepository.register(request);

      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterFailure(
        e.toString().replaceFirst('Exception: ', ''),
      ));
    }
  }
}
