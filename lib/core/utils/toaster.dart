// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magenta/features/app/components_overrides/app_text.dart';

// 🌎 Project imports:


// 🌎 Project imports:

class Toaster {
  Toaster._();

  static showDefault(String message) {
    BotToast.closeAllLoading();
    showToast(message);
  }

  static showLoading() {
    _showLoading();
  }

  static void showToast(String message) {
    BotToast.showCustomText(
      animationDuration: const Duration(seconds: 1),
      animationReverseDuration: const Duration(seconds: 1),
      align: Alignment.topCenter,
      duration: const Duration(seconds: 3),
      toastBuilder: (void Function() cancelFunc) {
        return AnimatedContainer(
          height: 70.h,
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: AppText.titleMedium(
              message,
              color: Colors.white,
              fontWeight: FontWeight.normal,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }

  static void _showLoading() {
    BotToast.showLoading();
  }

  static closeLoading() {
    _closeLoading();
  }

  static void _closeLoading() {
    BotToast.closeAllLoading();
  }
}
