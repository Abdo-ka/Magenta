// 🐦 Flutter imports:
import 'package:core/core.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

export 'context_ext.dart';
export 'num_ext.dart';
export 'widget_ext.dart';

extension StringExtension on String {
  String pathParam(String param) => '$this/:$param';
}

extension ListWidgetExtension on List<Widget> {
  List<Widget> separated(Widget separator) =>
      map((e) => [e, separator]).expand((e) => e).toList();
}

extension SliverSizedBox on SizedBox {
  Widget get toSliver => SliverToBoxAdapter(child: this);
}

extension Validator on GlobalKey<FormBuilderState> {
  bool validate() {
    currentState?.validate();
    currentState?.save();
    return currentState?.isValid ?? false;
  }

  dynamic fieldValue(String fieldName) {
    return currentState?.value[fieldName];
  }

  void callIfValid(void Function() callback) {
    if (validate()) callback();
  }
}

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

extension BoolExtension on bool {
  int toInt() => this ? 1 : 0;
}



extension BuildContextExt on BuildContext {

  ThemeData get theme => Theme.of(this);

  

  Color get primaryColor => colorScheme.primary;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  
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

  get locale => Localizations.localeOf(this);
}

extension FontWeightExtension on FontWeight {
  FontWeight get thin => FontWeight.w100;
  FontWeight get extraLight => FontWeight.w200;
  FontWeight get light => FontWeight.w300;
  FontWeight get normal => FontWeight.w400;
  FontWeight get regular => FontWeight.w400;
  FontWeight get medium => FontWeight.w500;
  FontWeight get semiBold => FontWeight.w600;
  FontWeight get bold => FontWeight.w700;
  FontWeight get extraBold => FontWeight.w800;
  FontWeight get black => FontWeight.w900;
}

extension FigmaDimension on num {
  ///use this to get font height to set in text from flutter
  double fromFigmaHeight(double fontSize) {
    return h / fontSize.sp;
  }
}
