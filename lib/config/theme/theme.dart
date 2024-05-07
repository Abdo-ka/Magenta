// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:magenta/config/theme/app_typography.dart';
import 'package:magenta/config/theme/color_scheme.dart';

// 🌎 Project imports:


export 'app_typography.dart';
export 'color_scheme.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
        brightness: Brightness.light,
        colorScheme: AppColorScheme.light,
        textTheme: AppTypography.textTheme,
        fontFamily: AppTypography.poppinsFamily,
        appBarTheme: _appBarTheme(AppColorScheme.light),
        switchTheme: SwitchThemeData(thumbColor: MaterialStatePropertyAll(AppColorScheme.light.background)),
      );

  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        colorScheme: AppColorScheme.dark,
        textTheme: AppTypography.textTheme,
        fontFamily: AppTypography.poppinsFamily,
        appBarTheme: _appBarTheme(AppColorScheme.dark),
        switchTheme: SwitchThemeData(thumbColor: MaterialStatePropertyAll(AppColorScheme.light.background)),
      );

  static AppBarTheme _appBarTheme(ColorScheme scheme) =>
      AppBarTheme(color: scheme.background, centerTitle: true);
}
