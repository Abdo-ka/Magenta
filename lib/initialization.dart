// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 🌎 Project imports:
import 'package:magenta/core/di/di_container.dart';
import 'package:magenta/services/crashlytics_service.dart';
import 'package:magenta/services/notification_service.dart';

preInitializations() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  await NotificationService.init();
  await Future.wait([
    EasyLocalization.ensureInitialized(),
    ScreenUtil.ensureScreenSize(),
  ]);
  EasyLocalization.logger.enableLevels = [];

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  CrashlyticsService.captureError();
}
