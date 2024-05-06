// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:magenta/core/extension/extensions.dart';
import 'package:magenta/features/app/components_overrides/app_image.dart';
import 'package:magenta/features/app/components_overrides/button_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      height: widgetDimension,
      width: widgetDimension,
      backgroundColor: buttonColor,
      radius: radius,
      onPressed: onPressed,
      padding: padding ?? const EdgeInsets.all(8),
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
