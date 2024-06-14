// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 🌎 Project imports:
import 'package:magenta/config/theme/theme.dart';
import 'core/di/di_container.dart';
import 'services/localization/localization_services.dart';
import 'services/router/router.dart';

class MagentaApp extends StatefulWidget {
  const MagentaApp({super.key});

  @override
  State<MagentaApp> createState() => _MagentaAppState();
}

class _MagentaAppState extends State<MagentaApp> {
  final AppRouter router = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return LocalizationServices(
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: MaterialApp.router(
              title: "Magenta",
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              
              locale: context.locale,
              routerConfig: router.config(),
              theme: AppTheme.light,
              themeMode: ThemeMode.light,
              builder: BotToastInit(),
            ),
          );
        },
      ),
    );
  }
}
