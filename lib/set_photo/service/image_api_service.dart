import 'package:provider/provider.dart';
import '../models/image_result_model.dart';
import '../provider/image_api_provider.dart';

class ImageApiService {
  ImageApiService({required this.apiProvider});
  final ImageApiProvider apiProvider;
  static ImageApiService of(context) => Provider.of(context, listen: false);

  Future<List<Value?>> getImages(String searchText, int page) async {
    return apiProvider.fetchImages(searchText, page);
  }
}
