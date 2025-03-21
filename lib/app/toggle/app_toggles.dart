import 'package:flutter_template/app/config/app_config.dart';
import 'package:growthbook_sdk_flutter/growthbook_sdk_flutter.dart';

class AppToggles {
  AppToggles._();

  static late GrowthBookSDK _client;

  static String get appVersionMinHard =>
      _client.feature('app-version-min-hard').value as String? ?? '0.1.0';

  static String get appVersionMinSoft =>
      _client.feature('app-version-min-soft').value as String? ?? '0.1.0';

  /// Initialize the GrowthBook client and fetch all toggles.
  static Future<void> init() async {
    _client =
        await GBSDKBuilderApp(
          apiKey: AppConfig.growthBookApiKey,
          hostURL: AppConfig.growthBookHost,
          backgroundSync: true,
          growthBookTrackingCallBack: (data) {},
        ).initialize();
    await refresh();
  }

  /// Force a refresh of toggles from the server
  static Future<void> refresh() async {
    return await _client.refresh();
  }
}
