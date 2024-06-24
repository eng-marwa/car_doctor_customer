import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../data/datasource/remote/ApiConstant.dart';

@module
abstract class DioModule {
  @injectable
  Dio get dio=> Dio(BaseOptions(
    baseUrl: baseUrl,
    queryParameters: {'limit': 100},
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {
      'Content-Type': 'application/json',
    },
  ))
    ..interceptors.add(LogInterceptor(responseBody: true));
}