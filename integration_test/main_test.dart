import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magenta/app.dart';
import 'package:magenta/initialization.dart';
import 'package:patrol/patrol.dart';

void main() {
  patrolTest(
    'Magenta App Test',
    ($) async {
      await preInitializations();
      if (await $.native.isPermissionDialogVisible()) {
        await $.native.grantPermissionWhenInUse();
      }
      await $.pumpWidget(const MagentaApp());
      await Future<void>.delayed(const Duration(seconds: 2));
      await $('Skip').tap();
      await $('Start Imagination').tap();
      await Future<void>.delayed(Duration(seconds: 1));
      await $(FormBuilderTextField).at(0).enterText('aaasdf@gmail.com');
      await $(FormBuilderTextField).at(1).enterText('12345678');
      await $('Log In').tap();
      await Future<void>.delayed(Duration(seconds: 2));

      // await $(ButtonWidget)
      //     .which<ElevatedButton>(
      //       (widget) => widget.enabled,
      //     )
      //     .at(2)
      //     .scrollTo()
      //     .tap();

      // await $(List).containing($('Th e Place Of Imagination!')).$('skip').tap();
    },
  );
}
