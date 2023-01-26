import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import '../env.dart';
import '../set_photo/image_result_model.dart';

class ImageApiService {
  static ImageApiService of(context) => Provider.of(context, listen: false);

  Future<ImageResult> getImages(String searchText) async {
    const imagesApiKey = String.fromEnvironment('imagesApiKey');
    BaseOptions options = BaseOptions(
      baseUrl: Env.baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    final interceptor = ApiProviderImageInterceptor();

    Dio dio = Dio(options)..interceptors.add(interceptor);
    Response<dynamic> response = await dio.get(
      '/images/search?q=$searchText',
    );
    print(response.data);
    return ImageResult.fromJson(response.data);
  }
}

class ApiProviderImageInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    handler.next(
      options
        ..headers.addAll({
          "X-RapidAPI-Key": Env.imagesApiKey,
          "X-RapidAPI-Host": Env.apiHost,
        }),
    );
  }
}
