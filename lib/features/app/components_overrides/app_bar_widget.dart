import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magenta/core/extension/context_ext.dart';
import 'package:magenta/features/app/components_overrides/app_image.dart';
import 'package:magenta/gen/assets.gen.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    this.backgroundColor,
    this.leading,
    this.actions,
    this.centerTitle,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.title,
  }) : super(key: key);

  final Color? backgroundColor;
  final Widget? leading;
  final List<Widget>? actions;
  final bool? centerTitle;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: backgroundColor ?? context.colorScheme.surface,
      leading: leading ??
         IconButton(
          key: Key('backButton'),
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: context.colorScheme.primary,
            size: 18,
          ),
          onPressed:  () => Navigator.pop(context),
          padding: EdgeInsets.zero,
        ),
      actions: actions,
      centerTitle: centerTitle,
      elevation: elevation,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
