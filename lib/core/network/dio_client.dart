import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DioClient {
  final Dio dio;

  DioClient(this.dio);
}
