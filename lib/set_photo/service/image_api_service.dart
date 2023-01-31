import 'package:provider/provider.dart';
import '../models/image_result_model.dart';
import '../provider/image_api_provider.dart';

class ImageApiService {
  // ImageApiService({required this.apiClient});
  // final ApiClient apiClient;
  static ImageApiService of(context) => Provider.of(context, listen: false);

  Future<ImageResult> getImages(String searchText) async {
    return ImageApiProvider().fetchImages(searchText);
  }
}
