// 🌎 Project imports:
import 'package:magenta/config/common/enum/enums.dart';

abstract class EnvironmentVariables {
  static const appname = String.fromEnvironment('APP_NAME');
  static const bundleId = String.fromEnvironment('BUNDLE_ID');
  static const apiKey = String.fromEnvironment('API_KEY_ANDROID');
  static const appID = String.fromEnvironment('APP_ID_ANDROID');
  static const projectId = String.fromEnvironment('ANDROID_PROJECT_ID');
  static const storageBucket = String.fromEnvironment('ANDROID_STORAGE_BUCKET');
  static const iosBundleId = String.fromEnvironment('IOS_BUNDLE_ID');
  static const iosApiKey = String.fromEnvironment('API_KEY_IOS');
  static const iosAppId = String.fromEnvironment('APP_ID_IOS');
  static final Flavor flavor =
      Flavor.values.firstWhere((element) => appname.contains(element.name));
}
