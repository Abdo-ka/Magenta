// 🎯 Dart imports:
import 'dart:ui';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 🌎 Project imports:
import 'package:magenta/core/extension/extensions.dart';
import 'package:magenta/features/app/components_overrides/app_image.dart';
import 'package:magenta/features/app/components_overrides/icon_button_widget.dart';
import 'package:magenta/gen/assets.gen.dart';

class AnimatedDialog extends StatelessWidget {
  const AnimatedDialog._(
      {required this.child,
      this.backgroundColor,
      this.elevation,
      required this.insetAnimationDuration,
      required this.insetAnimationCurve,
      this.insetPadding,
      required this.clipBehavior,
      this.shape,
      this.alignment});

  final Widget child;
  final Color? backgroundColor;
  final double? elevation;
  final Duration insetAnimationDuration;
  final Curve insetAnimationCurve;
  final EdgeInsets? insetPadding;
  final Clip clipBehavior;
  final ShapeBorder? shape;
  final AlignmentGeometry? alignment;

  static Future<T?> show<T>(
    BuildContext context, {
    required Widget child,
    RouteTransitionsBuilder? transitionBuilder,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
    bool barrierDismissible = true,
    String? barrierLabel = 'close',
    Color barrierColor = const Color(0x80000000),
    Color? backgroundColor,
    double? elevation,
    Duration insetAnimationDuration = const Duration(milliseconds: 100),
    Curve insetAnimationCurve = Curves.decelerate,
    EdgeInsets? insetPadding,
    Clip clipBehavior = Clip.none,
    ShapeBorder? shape,
    AlignmentGeometry? alignment,
  }) {
    return showGeneralDialog(
      context: context,
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) =>
          AnimatedDialog._(
              backgroundColor: backgroundColor,
              alignment: alignment,
              clipBehavior: clipBehavior,
              elevation: elevation,
              insetAnimationCurve: insetAnimationCurve,
              insetAnimationDuration: insetAnimationDuration,
              insetPadding: insetPadding ??
                  EdgeInsets.symmetric(horizontal: 40.0.w, vertical: 24.0.h),
              shape: shape ??
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r)),
              child: child),
      transitionDuration: const Duration(milliseconds: 400),
      anchorPoint: anchorPoint,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      routeSettings: routeSettings,
      transitionBuilder: transitionBuilder,
      useRootNavigator: useRootNavigator,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
      child: Stack(
        children: [
          Positioned(
            top: 40,
            right: 40,
            child: IconButtonWidget(
              onPressed: () {
                Navigator.pop(context);
              },
              child: AppImage.asset(
                Assets.icons.close,
                color: context.isDark == true ? Colors.white : null,
              ),
            ),
          ),
          Dialog(
            backgroundColor: backgroundColor,
            alignment: alignment,
            clipBehavior: clipBehavior,
            elevation: elevation,
            insetAnimationCurve: insetAnimationCurve,
            insetAnimationDuration: insetAnimationDuration,
            insetPadding: insetPadding,
            shape: shape,
            child: child,
          ),
        ],
      ),
    );
  }
}
