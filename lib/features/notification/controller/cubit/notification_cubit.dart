// 📦 Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:magenta/config/common/enum/enums.dart';
import 'package:magenta/features/notification/repositories/notification_repositories.dart';

part 'notification_state.dart';

@injectable
class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepositories notificationRepositories;
  NotificationCubit(this.notificationRepositories)
      : super(const NotificationState());
  void getNotification() async {
    emit(state.copyWith(getNotificationStatus: Status.loading));
    final result = await notificationRepositories.getNotificationRepo();
    result.fold(
        (_) => emit(state.copyWith(getNotificationStatus: Status.failure)),
        (r) {
      emit(
        state.copyWith(getNotificationStatus: Status.success),
      );
    });
  }
}
