import 'package:injectable/injectable.dart';
import 'package:universitys_gate/core/network/dio_client.dart';
import 'package:universitys_gate/features/authentication/data/models/forgot_password_request_model.dart';
import 'package:universitys_gate/features/authentication/data/models/login_request_model.dart';
import 'package:universitys_gate/features/authentication/data/models/register_request_model.dart';
import 'package:universitys_gate/features/authentication/data/models/reset_password_request_model.dart';
import 'package:universitys_gate/features/authentication/data/models/verify_otp_request_model.dart';

abstract class AuthRepository {
  Future<void> login(LoginRequestModel request);
  Future<void> register(RegisterRequestModel request);
  Future<void> forgotPassword(ForgotPasswordRequestModel request);
  Future<void> verifyOtp(VerifyOtpRequestModel request);
  Future<void> resetPassword(ResetPasswordRequestModel request);
}

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final DioClient dioClient;

  AuthRepositoryImpl(this.dioClient);

  @override
  Future<void> login(LoginRequestModel request) async {
    try {
      await Future.delayed(const Duration(milliseconds: 800));
    } catch (e) {
      throw Exception(
        e.toString().replaceFirst('Exception: ', ''),
      );
    }
  }

  @override
  Future<void> register(RegisterRequestModel request) async {
    try {
      await Future.delayed(const Duration(milliseconds: 1000));
    } catch (e) {
      throw Exception(
        e.toString().replaceFirst('Exception: ', ''),
      );
    }
  }

  @override
  Future<void> forgotPassword(ForgotPasswordRequestModel request) async {
    try {
      await Future.delayed(const Duration(milliseconds: 900));
    } catch (e) {
      throw Exception(
        e.toString().replaceFirst('Exception: ', ''),
      );
    }
  }

  @override
  Future<void> verifyOtp(VerifyOtpRequestModel request) async {
    try {
      await Future.delayed(const Duration(milliseconds: 800));
    } catch (e) {
      throw Exception(
        e.toString().replaceFirst('Exception: ', ''),
      );
    }
  }

  @override
  Future<void> resetPassword(ResetPasswordRequestModel request) async {
    try {
      await Future.delayed(const Duration(milliseconds: 1000));
    } catch (e) {
      throw Exception(
        e.toString().replaceFirst('Exception: ', ''),
      );
    }
  }
}
