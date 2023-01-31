import 'package:dio/dio.dart';

import 'interceptor.dart';

class ApiClient {
  static const baseUrl = String.fromEnvironment('baseUrl');

  get options => BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 3000,
      );

  Future<Response<dynamic>> get(String path,
      {Map<String, dynamic>? queryParameters}) {
    final interceptor = ApiProviderImageInterceptor();
    final dio = Dio(options)..interceptors.add(interceptor);
    return dio.get(path);
  }
}
