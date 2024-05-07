// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:magenta/app.dart';
import 'package:magenta/initialization.dart';

void main() async {
  await preInitializations();
  

  runApp(const MagentaApp());
}
