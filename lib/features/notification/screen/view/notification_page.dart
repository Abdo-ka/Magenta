// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magenta/config/common/enum/enums.dart';
import 'package:magenta/core/di/di_container.dart';
import 'package:magenta/features/notification/controller/cubit/notification_cubit.dart';

// 🌎 Project imports:
import 'package:magenta/features/notification/screen/widget/list_tile_notification_widget.dart';

// 🌎 Project imports:

@RoutePage()
class NotificationPage extends StatelessWidget {
  final bloc = getIt<NotificationCubit>();
  NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: Scaffold(
        appBar: AppBar(
          title: AppText(
            'Notification Bar',
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
           return state.getNotificationStatus == Status.loading
                ?  const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(padding: const EdgeInsets.all(16), children: [
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                  ]);
          },
        ),
      ),
    );
  }
}
