import 'package:dio/dio.dart';

import 'interceptor.dart';

class ApiClient {
  static const baseUrl = String.fromEnvironment('baseUrl');

  BaseOptions get options => BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 3000,
      );
  final _interceptor = ApiProviderImageInterceptor();

  Future<Response<dynamic>> get(String path,
      {Map<String, dynamic>? queryParameters}) {
    final _dio = Dio(options)..interceptors.add(_interceptor);
    return _dio.get(path);
  }
}
