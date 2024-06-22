// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';

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
