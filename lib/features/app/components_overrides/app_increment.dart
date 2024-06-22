// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 🌎 Project imports:
import 'package:magenta/core/extension/context_ext.dart';
import 'package:magenta/features/app/components_overrides/app_text.dart';
import 'package:magenta/features/app/components_overrides/icon_button_widget.dart';

class AppIncrement extends StatefulWidget {
  const AppIncrement({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });
  final int initialValue;
  final Function(int value) onChanged;

  @override
  State<AppIncrement> createState() => _AppIncrementState();
}

class _AppIncrementState extends State<AppIncrement> {
  late final ValueNotifier<int> incrementValue;

  @override
  void initState() {
    super.initState();
    incrementValue = ValueNotifier(widget.initialValue);
  }

  @override
  void dispose() {
    incrementValue.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 50.h,
      decoration: BoxDecoration(
          border: Border.all(color: context.colorScheme.primary),
          borderRadius: BorderRadius.circular(8)),
      child: ValueListenableBuilder<int>(
        valueListenable: incrementValue,
        builder: (BuildContext context, int value, Widget? child) => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButtonWidget(
              buttonColor: Colors.transparent,
              onPressed: () {
                incrementValue.value++;
                widget.onChanged(incrementValue.value);
              },
              child: const Icon(Icons.add),
            ),
            AppText('$value'),
            IconButtonWidget(
              buttonColor: Colors.transparent,
              onPressed: () {
                if (value > 0) {
                  incrementValue.value--;
                  widget.onChanged(incrementValue.value);
                }
              },
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
