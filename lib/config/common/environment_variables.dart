import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:magenta/config/common/enum/enums.dart';


abstract class EnvironmentVariables {
  

  static const appname = const String.fromEnvironment('APP_NAME');
  static const bundleId = const String.fromEnvironment('BUNDLE_ID');
  static final Flavor flavor = Flavor.values.firstWhere((element) => appname.contains(element.name));
 
}

