// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'notification_cubit.dart';

class NotificationState extends Equatable {
  final Status getNotificationStatus;

  const NotificationState({
    this.getNotificationStatus = Status.initial,
  });

  @override
  List<Object> get props => [
        getNotificationStatus,
      ];

  NotificationState copyWith({
    Status? getNotificationStatus,
  }) {
    return NotificationState(
      getNotificationStatus: getNotificationStatus ?? this.getNotificationStatus,
    );
  }
}
