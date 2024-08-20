// 🐦 Flutter imports:
import 'package:core/core.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:


class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    required this.onPressed,
    this.iconPath,
    this.child,
    this.buttonColor,
    this.iconColor,
    this.imageDimension = 20,
    this.widgetDimension = 42,
    this.padding,
    this.radius = 12,
    this.isCircle = false,
  }) : assert(iconPath != null || child != null);

  final VoidCallback onPressed;
  final String? iconPath;
  final Widget? child;
  final Color? buttonColor;
  final Color? iconColor;
  final double imageDimension;
  final double widgetDimension;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      height: widgetDimension,
      width: widgetDimension,
      backgroundColor: buttonColor,
      radius: radius,
      isCircle: isCircle,
      onPressed: onPressed,
      padding: padding ?? const EdgeInsets.all(5),
      prefixIcon: child ??
          AppImage.asset(
            iconPath!,
            height: imageDimension,
            width: imageDimension,
            color: iconColor ?? context.colorScheme.onSurfaceVariant,
          ),
    );
  }
}
