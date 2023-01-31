import 'package:dio/dio.dart';

import '../../api/api_client.dart';
import '../models/image_result_model.dart';

class ImageApiProvider {
  Future<ImageResult> fetchImages(String searchText) async {
    Response<dynamic> response =
        await ApiClient().get('/images/search?q=$searchText');
    return ImageResult.fromJson(response.data);
  }
}
