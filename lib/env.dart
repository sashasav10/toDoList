import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '../.env')
abstract class Env {
  @EnviedField(varName: 'IMAGES_API_KEY')
  static const imagesApiKey = _Env.imagesApiKey;
}
