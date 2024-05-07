// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magenta/core/di/di_container.dart';

// 🌎 Project imports:


// 📦 Package imports:

// 🌎 Project imports:

Future preInitializations() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  // await NotificationService.init();
  await Future.wait([
    EasyLocalization.ensureInitialized(),
    ScreenUtil.ensureScreenSize(),
  ]);
  EasyLocalization.logger.enableLevels = [];

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
