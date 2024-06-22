// 🌎 Project imports:
import 'package:magenta/config/common/enum/enums.dart';

abstract class EnvironmentVariables {
  

  static const appname = String.fromEnvironment('APP_NAME');
  static const bundleId = String.fromEnvironment('BUNDLE_ID');
  static final Flavor flavor = Flavor.values.firstWhere((element) => appname.contains(element.name));
 
}

