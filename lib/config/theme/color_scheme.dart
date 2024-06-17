// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class AppColorScheme {
  static const light = ColorScheme.light(
    primary: Color(0xFFFF0090),
    onPrimary: Color(0xFFFDFFFA),
    primaryContainer: Color(0xffFFECCC),
    onPrimaryContainer: Color(0xff3A6012),
    secondary: Color(0xFF088EAA),
    secondaryContainer: Color(0xFFDCF2FF),
    onSecondary: Color(0xFFFFFFFF),
    error: Color(0xFFFF4000),
    onError: Color(0xFFFFFAF9),
    tertiary: Color(0xff287D0E),
    onTertiary: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFEDE8),
    onErrorContainer: Color(0xFF87361D),
    surface: Color(0xFFF7F8FA),
    onSurface: Color(0xFF34313C),
    surfaceContainerHighest: Color(0xFFDEDDE1),
    onSurfaceVariant: Color(0xFF534F5C),
    outline: Color(0xffd9dce9),
    onInverseSurface: Color(0xFFEFF1F1),
    inverseSurface: Color(0xFF6C6E7B),
    shadow: Color(0xFF000000),
  );

  static const dark = ColorScheme.light(
    primary: Color(0xFF77AF23),
    onPrimary: Color(0xFFFDFFFA),
    primaryContainer: Color(0xffF9FFEE),
    onPrimaryContainer: Color(0xff3A6012),
    secondary: Color(0xFF277CAD),
    secondaryContainer: Color(0xFFDCF2FF),
    onSecondary: Color(0xFFFFFFFF),
    error: Color(0xFFF7744C),
    onError: Color(0xFFFFFAF9),
    tertiary: Color(0xff023047),
    onTertiary: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFEDE8),
    onErrorContainer: Color(0xFF87361D),
    surface: Color(0xFFF7F8FA),
    onSurface: Color(0xFF34313C),
    surfaceContainerHighest: Color(0xFFDEDDE1),
    onSurfaceVariant: Color(0xFF534F5C),
    outline: Color(0xFF716E79),
    onInverseSurface: Color(0xFFEFF1F1),
    inverseSurface: Color(0xFF2D3132),
    shadow: Color(0xFF000000),
  );
}

extension TextColorScheme on ColorScheme {
  Color get primaryText => brightness == Brightness.light
      ? const Color(0xffEFF1F1)
      : const Color(0xff1E1F24);

  Color get secondaryText => brightness == Brightness.light
      ? const Color(0xff6C6E7B)
      : const Color(0xffEFF1F1);
}

extension ExtraColors on ColorScheme {
  Color get gray => brightness == Brightness.light
      ? const Color(0xffEBEDF4)
      : const Color(0xff534F5C);

  Color get iconGray => brightness == Brightness.light
      ? const Color(0xff6C6E7B)
      : const Color(0xff534F5C);

  Color get lightGreen => const Color(0xffE3F8CC);

  Color get lightBlue => const Color(0xffCAFAF4);
}

extension ColorTools on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
