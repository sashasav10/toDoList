import 'package:dio/dio.dart';

import '../../api/api_client.dart';
import '../models/image_result_model.dart';

class ImageApiProvider {
  Future<List<Value?>> fetchImages(String searchText, int page) async {
    Response<dynamic> response = await ApiClient().get(
        '/api/Search/ImageSearchAPI?q=$searchText&pageNumber=$page&pageSize=20&autoCorrect=true');
    return ImageResult.fromJson(response.data).value ?? [];
  }
}
