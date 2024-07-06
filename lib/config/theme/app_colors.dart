// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:core/core.dart';

// 🌎 Project imports:

abstract class AppColors {
  static const lightSurfaceContainer = Color(0xffECEEEF);
  static const darkSurfaceContainer = Color(0xff1D2021);

  static Color surfaceBright(BuildContext context) =>
      context.isDark ? DarkColors.darkSurfaceBright : LightColors.surfaceBright;
  static Color surfaceContainerLow(BuildContext context) => context.isDark
      ? DarkColors.surfaceLowContainer
      : LightColors.surfaceLowContainer;

  static Color surfaceContainer(BuildContext context) =>
      context.isDark ? const Color(0xff1D2021) : const Color(0xffECEEEF);
}

abstract class DarkColors {
  static const Color darkSurfaceContainer = Color(0xff1D2021);
  static const Color darkSurfaceBright = Color(0xff212525);
  static const Color surfaceLowContainer = Color(0xff191C1D);
  static const Color surfaceHighContainer = Color(0xff272B2B);
}

abstract class LightColors {
  static const Color surfaceContainer = Color(0xffECEEEF);
  static const Color surfaceBright = Color(0xffF8FAFA);
  static const Color surfaceLowContainer = Color(0xffF8FAFA);
  static const Color surfaceHighContainer = Color(0xffE6E8E9);
}
