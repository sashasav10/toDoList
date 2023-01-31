import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import '../set_photo/image_result_model.dart';
import 'api/api_client.dart';

class ImageApiService {
  static ImageApiService of(context) => Provider.of(context, listen: false);

  Future<ImageResult> getImages(String searchText) async {
    Response<dynamic> response =
        await ApiClient().get('/images/search?q=$searchText');
    return ImageResult.fromJson(response.data);
  }
}
