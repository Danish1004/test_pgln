import 'package:envied/envied.dart';
part 'env.g.dart';

@Envied(path: '.env') // Specify the path to your .env file
abstract class Env {
  @EnviedField(varName: 'API_KEY_ANDROID')
  static final String apiKeyAndroid = Env.apiKeyAndroid;

  @EnviedField(varName: 'API_KEY_IOS')
  static final String apiKeyIos = Env.apiKeyIos;

  @EnviedField(varName: 'API_KEY_WEB')
  static final String apiKeyWeb = Env.apiKeyWeb;
}
