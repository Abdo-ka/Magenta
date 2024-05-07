// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';

// 🌎 Project imports:
import 'package:magenta/core/utils/app_localization.dart';

class LocalizationServices extends StatelessWidget {
  const LocalizationServices({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: AppLocalization.supportedLocales,
      path: 'assets/translations',
      fallbackLocale: AppLocalization.fallbackLocale,
      startLocale: AppLocalization.enLocale,
      saveLocale: true,
      child: child,
    );
  }
}
