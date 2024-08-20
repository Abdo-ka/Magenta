// 🐦 Flutter imports:
import 'package:core/core.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:


class ButtonWidget extends StatelessWidget {
  static Color surfaceContainer(BuildContext context) =>
      context.isDark ? const Color(0xff1D2021) : const Color(0xffECEEEF);

  const ButtonWidget({
    super.key,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.text,
    this.prefixIcon,
    this.suffixIcon,
    this.radius,
    this.isOutlined = false,
    this.isElevated = false,
    this.borderColor,
    this.width,
    this.height = 50,
    this.isCenter = false,
    this.padding,
    this.spaceBetween,
    this.textDirection,
    this.textStyle,
    this.isDisabled = false,
    this.childPadding,
    this.isCircle = false,
  });

  final Function() onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final String? text;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? radius;
  final double? spaceBetween;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? childPadding;
  final bool isOutlined;
  final bool isCenter;
  final bool isElevated;
  final TextDirection? textDirection;
  final TextStyle? textStyle;
  final bool isDisabled;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: !isDisabled ? onPressed : () {},
      style: ElevatedButton.styleFrom(
        elevation: isElevated ? null : 0,
        backgroundColor: isOutlined
            ? (backgroundColor ?? Colors.transparent)
            : (backgroundColor ?? surfaceContainer(context)),
        shadowColor: Colors.transparent,
        foregroundColor: foregroundColor,
        fixedSize: getFixedSize,
        minimumSize: const Size(0, 0),
        maximumSize: getFixedSize,
        padding: padding ?? EdgeInsets.zero,
        shape: isCircle == true
            ? const StadiumBorder()
            : ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(radius ?? 36),
                side: BorderSide(
                  color: isOutlined
                      ? (borderColor ?? Theme.of(context).colorScheme.outline)
                      : Colors.transparent,
                  width: 1,
                ),
              ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null) prefixIcon!,
          if (spaceBetween != null && text != null && prefixIcon != null)
            spaceBetween!.ws,
          if (text != null)
            Center(
                child: AppText(
              text ?? '',
              textDirection: textDirection,
              style: textStyle,
            )),
          if (spaceBetween != null && text != null && suffixIcon != null)
            SizedBox(width: spaceBetween),
          if (suffixIcon != null) suffixIcon!,
        ],
      ).wrapPadding(childPadding ?? EdgeInsets.zero),
    );
  }

  Size? get getFixedSize {
    if (width == null && height == null) {
      return null;
    } else if (width != null && height == null) {
      return Size.fromWidth(width!);
    } else if (width == null && height != null) {
      return Size.fromHeight(height!);
    } else {
      return Size(width!, height!);
    }
  }
}
