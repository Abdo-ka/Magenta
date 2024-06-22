// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:magenta/core/extension/context_ext.dart';
import 'package:magenta/features/app/components_overrides/app_image.dart';
import 'package:magenta/features/app/components_overrides/app_text.dart';
import 'package:magenta/features/app/components_overrides/icon_button_widget.dart';
import 'package:magenta/gen/assets.gen.dart';

class ListTileNotification extends StatelessWidget {
  const ListTileNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      shape: RoundedRectangleBorder(
        side: BorderSide(color: context.colorScheme.primary),
        borderRadius: BorderRadius.circular(12),
      ),
      title: AppText(
        'The payment you did is ended successfully!! ',
        style: context.textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: IconButtonWidget(
        onPressed: () {},
        buttonColor: context.colorScheme.surface,
        child: AppImage.asset(
          Assets.icons.remove,
          color: context.colorScheme.primary,
        ),
      ),
    );
  }
}
