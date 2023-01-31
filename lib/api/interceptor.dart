import 'package:dio/dio.dart';

class ApiProviderImageInterceptor extends Interceptor {
  static const imagesApiKey = String.fromEnvironment('imagesApiKey');
  static const apiHost = String.fromEnvironment('apiHost');

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    handler.next(
      options
        ..headers.addAll({
          "X-RapidAPI-Key": imagesApiKey,
          "X-RapidAPI-Host": apiHost,
        }),
    );
  }
}
