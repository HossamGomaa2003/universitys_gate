import 'package:easy_localization/easy_localization.dart';

abstract class Failure {
  final String message;

  const Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure([String? message])
      : super(message ?? 'error.server_error'.tr());
}

class NetworkFailure extends Failure {
  NetworkFailure([String? message])
      : super(message ?? 'error.network_error'.tr());
}

class CacheFailure extends Failure {
  CacheFailure([String? message])
      : super(message ?? 'error.cache_error'.tr());
}
