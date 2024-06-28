import 'package:envied/envied.dart';

part 'app_config.g.dart';

@Envied()
abstract class AppConfig {
  @EnviedField(varName: 'FLAVOR')
  static const String flavor = _AppConfig.flavor;

  @EnviedField(varName: 'GROWTHBOOK_API_KEY', obfuscate: true)
  static final String growthBookApiKey = _AppConfig.growthBookApiKey;

  @EnviedField(varName: 'GROWTHBOOK_HOST', obfuscate: true)
  static final String growthBookHost = _AppConfig.growthBookHost;

  @EnviedField(varName: 'GROWTHBOOK_SSE_URL', obfuscate: true)
  static final String growthBookSseUrl = _AppConfig.growthBookSseUrl;

  // FLAVORS
  static bool get isDev => flavor == 'dev';
  static bool get isStage => flavor == 'stage';
  static bool get isProduction => flavor == 'production';
}
