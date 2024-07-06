// 🐦 Flutter imports:
import 'package:core/core.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';

// 🌎 Project imports:


class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    this.backgroundColor,
    this.leading,
    this.actions,
    this.centerTitle,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.title,
  });

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
            key: const Key('backButton'),
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: context.colorScheme.primary,
              size: 18,
            ),
            onPressed: () => context.router.pop(),
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
