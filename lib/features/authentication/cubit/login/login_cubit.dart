import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:universitys_gate/features/authentication/data/models/login_request_model.dart';
import 'package:universitys_gate/features/authentication/data/repositories/auth_repository.dart';


import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;

  LoginCubit(this.authRepository) : super(LoginInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    try {
      final request = LoginRequestModel(
        email: email.trim(),
        password: password,
      );

      await authRepository.login(request);

      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(
        e.toString().replaceFirst('Exception: ', ''),
      ));
    }
  }
}