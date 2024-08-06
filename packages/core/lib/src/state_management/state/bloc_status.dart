import 'dart:core';

import 'package:core/src/error/app_exception.dart';

enum StatusBloc { initial, loading, success, failure }

class BlocStatus {
  final StatusBloc status;

  const BlocStatus._({this.status = StatusBloc.initial}) : failure = null;
  final AppException? failure;
  const BlocStatus.loading()
      : status = StatusBloc.loading,
        failure = null;
  const BlocStatus.success()
      : status = StatusBloc.success,
        failure = null;
  const BlocStatus.failure(this.failure) : status = StatusBloc.failure;
  const BlocStatus.initial()
      : status = StatusBloc.initial,
        failure = null;

  bool isLoading() => status == StatusBloc.loading;
  bool isInitial() => status == StatusBloc.initial;
  bool isFailure() => status == StatusBloc.failure;
  bool isSuccess() => status == StatusBloc.success;
}
