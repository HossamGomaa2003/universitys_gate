import 'package:injectable/injectable.dart';

import '../models/login_request_model.dart';

abstract class AuthRepository {
  Future<void> login(LoginRequestModel request);
}

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl();

  @override
  Future<void> login(LoginRequestModel request) async {
    try {
      // Simulate API network call
      await Future.delayed(const Duration(milliseconds: 800));
    } catch (e) {
      throw Exception(
        e.toString().replaceFirst('Exception: ', ''),
      );
    }
  }
}
