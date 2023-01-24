import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import '../env.dart';
import '../set_photo/image_result_model.dart';

class ImageApiService {
  static ImageApiService of(context) => Provider.of(context, listen: false);

  Future<ImageResult> getImages(String searchText) async {
    //const imagesApiKey = String.fromEnvironment('IMAGES_API_KEY');
    Dio dio = Dio();
    Response<dynamic> response = await dio.get(
        "https://bing-image-search1.p.rapidapi.com/images/search?q=$searchText",
        options: Options(
          headers: {
            "X-RapidAPI-Key": Env.imagesApiKey,
            "X-RapidAPI-Host": "bing-image-search1.p.rapidapi.com"
          },
        ));
    print(response.data);
    return ImageResult.fromJson(response.data);
  }
}
