import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import '../set_photo/image_result_model.dart';

class ImageApiService {
  static ImageApiService of(context) => Provider.of(context, listen: false);

  Future<ImageResult> getImages() async {
    Dio dio = Dio();
    Response<dynamic> response = await dio.get(
        "https://bing-image-search1.p.rapidapi.com/images/search?q=person",
        options: Options(
          headers: {
            "X-RapidAPI-Key":
                "b1a7f67b18msh424b6cb334a03c7p1396e6jsna22b094ae39b",
            "X-RapidAPI-Host": "bing-image-search1.p.rapidapi.com"
          },
        ));
    print(response.data);
    return ImageResult.fromJson(response.data);
  }
}
