import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import '../../services/image_api_service.dart';
import '../image_result_model.dart';

part 'image_store.g.dart';

class ImageStore extends _ImageStore with _$ImageStore {
  ImageStore({required super.imageApiService});

  static ImageStore of(context) => Provider.of(context, listen: false);
}

abstract class _ImageStore with Store {
  _ImageStore({required this.imageApiService});
  @action
  Future<void> init() async {
    _images = imageApiService.getImages() as ImageResult;
  }

  final ImageApiService imageApiService;
  @observable
  ImageResult? _images;
  ImageResult? get images => _images;
}
