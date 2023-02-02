import 'package:dio/dio.dart';

import 'interceptor.dart';

class ApiClient {
  static const baseUrl = String.fromEnvironment('baseUrl');

  BaseOptions get options => BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 6000,
        receiveTimeout: 6000,
      );

  late final _dio = Dio(options)
    ..interceptors.add(ApiProviderImageInterceptor());

  Future<Response<dynamic>> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return _dio.get(path);
  }
}
