// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 🌎 Project imports:
import 'package:magenta/core/extension/extensions.dart';
import 'package:magenta/features/app/components_overrides/app_text.dart';
import 'package:magenta/features/notification/screen/widget/list_tile_notification_widget.dart';

@RoutePage()
class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          'Notification Bar',
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 5,
          ),
          itemBuilder: (context, index) => const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: ListTileNotification(),
          ),
          itemCount: 10,
          shrinkWrap: true,
        ),
        50.verticalSpace,
      ]),
    );
  }
}
