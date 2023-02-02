import 'package:dio/dio.dart';

import '../../api/api_client.dart';
import '../models/image_result_model.dart';

class ImageApiProvider {
  Future<ImageResult> fetchImages(String searchText) async {
    Response<dynamic> response = await ApiClient().get(
        '/api/Search/ImageSearchAPI?q=$searchText&pageNumber=1&pageSize=20&autoCorrect=true');
    return ImageResult.fromJson(response.data);
  }
}
