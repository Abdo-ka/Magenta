import '../../error/app_exception.dart';

extension StateChecker on CommonState {
  bool isInitial() => this is InitialState;

  bool isLoading() => this is LoadingState;

  bool isError() => this is ErrorState;

  bool isSuccess() => this is SuccessState;

  AppException? get error => this is ErrorState ? (this as ErrorState).error : null;
}

sealed class CommonState<T> {
  Widget when<Widget>({
    required Widget Function() initial,
    required Widget Function() loading,
    required Widget Function(AppException) error,
    required Widget Function(T) success,
    required Widget Function() empty,
  });
}

final class InitialState<T> extends CommonState<T> {
  @override
  Widget when<Widget>({
    required Widget Function() initial,
    required Widget Function() loading,
    required Widget Function(AppException) error,
    required Widget Function(T) success,
    required Widget Function() empty,
  }) =>
      initial();
}

final class LoadingState<T> extends CommonState<T> {
  @override
  Widget when<Widget>({
    required Widget Function() initial,
    required Widget Function() loading,
    required Widget Function(AppException) error,
    required Widget Function(T) success,
    required Widget Function() empty,
  }) =>
      loading();
}

final class EmptyState<T> extends CommonState<T> {
  @override
  Widget when<Widget>({
    required Widget Function() initial,
    required Widget Function() loading,
    required Widget Function(AppException) error,
    required Widget Function(T) success,
    required Widget Function() empty,
  }) =>
      empty();
}

final class ErrorState<T> extends CommonState<T> {
  final AppException error;

  ErrorState({required this.error});

  @override
  Widget when<Widget>({
    required Widget Function() initial,
    required Widget Function() loading,
    required Widget Function(AppException) error,
    required Widget Function(T) success,
    required Widget Function() empty,
  }) =>
      error(this.error);
}

final class SuccessState<T> extends CommonState<T> {
  final T data;

  SuccessState({required this.data});

  @override
  Widget when<Widget>({
    required Widget Function() initial,
    required Widget Function() loading,
    required Widget Function(AppException) error,
    required Widget Function(T) success,
    required Widget Function() empty,
  }) =>
      success(this.data);
}

final class PaginationClass extends CommonState {
  @override
  Widget when<Widget>({
    required Widget Function() initial,
    required Widget Function() loading,
    required Widget Function(AppException p1) error,
    required Widget Function(dynamic p1) success,
    required Widget Function() empty,
  }) {
    // TODO: implement when
    throw UnimplementedError();
  }
}
