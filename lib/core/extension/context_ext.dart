// 🐦 Flutter imports:
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  LinearGradient get primaryLinear => LinearGradient(
        colors: [
          Theme.of(this).primaryColor,
          Theme.of(this).primaryColor.withOpacity(.5)
        ],
      );

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  Color get primaryColor => colorScheme.primary;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get fullWidth => mediaQuery.size.width;
  double get fullHeight => mediaQuery.size.height;

  /// Calculates the available height for the body content.
  /// It takes into account the device size, status bar height, toolbar height, bottom bar height, and bottom padding.
  double get bodyHeight {
    Size size = mediaQuery.size;
    double statusBar = mediaQuery.viewPadding.top;
    double kLeadingWidth = kToolbarHeight;
    double bottomBar = mediaQuery.viewInsets.bottom;
    double bottomPadding = mediaQuery.viewPadding.bottom;
    double bottomSafeArea = mediaQuery.padding.bottom;
    return size.height -
        statusBar -
        kLeadingWidth -
        bottomBar -
        bottomPadding -
        bottomSafeArea;
  }
}
