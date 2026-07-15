import 'package:dio/dio.dart';

import 'api_constants.dart';
import 'auth_interceptor.dart';

class ApiClient {
  ApiClient._();

  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      contentType: "application/json",
      headers: {
        "Accept": "application/json",
      },
    ),
  )..interceptors.add(AuthInterceptor());
}