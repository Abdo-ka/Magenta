// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:magenta/config/common/enum/enums.dart';
import 'package:magenta/config/common/environment_variables.dart';

// 🌎 Project imports:
import 'package:magenta/config/theme/app_typography.dart';
import 'package:magenta/config/theme/color_scheme.dart';

// 🌎 Project imports:

export 'app_typography.dart';
export 'color_scheme.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
        brightness: Brightness.light,
        colorScheme: EnvironmentVariables.flavor == Flavor.Dev
            ? AppColorScheme.lightDev
            : EnvironmentVariables.flavor == Flavor.Stag
                ? AppColorScheme.lightStage
                : AppColorScheme.lightProd,
        textTheme: AppTypography.textTheme,
        fontFamily: AppTypography.poppinsFamily,
        appBarTheme: _appBarTheme(AppColorScheme.lightProd),
        switchTheme: SwitchThemeData(
            thumbColor:
                WidgetStatePropertyAll(AppColorScheme.lightProd.surface)),
      );

  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        colorScheme: AppColorScheme.dark,
        textTheme: AppTypography.textTheme,
        fontFamily: AppTypography.poppinsFamily,
        appBarTheme: _appBarTheme(AppColorScheme.dark),
        switchTheme: SwitchThemeData(
            thumbColor:
                WidgetStatePropertyAll(AppColorScheme.lightProd.surface)),
      );

  static AppBarTheme _appBarTheme(ColorScheme scheme) =>
      AppBarTheme(color: scheme.surface, centerTitle: true);
}
