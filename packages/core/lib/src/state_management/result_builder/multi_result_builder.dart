import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core.dart';
import '../../error/app_exception.dart';

class MultiStateResultBuilder<B extends StateStreamable<List<CommonState>>, T, R extends Helper>
    extends StatelessWidget {
  const MultiStateResultBuilder({
    Key? key,
    required this.loaded,
    required this.emptyMessage,
    required this.empty,
    required this.initial,
    required this.loading,
    required this.fail,
    required this.stateEnum,
  }) : super(key: key);

  final Widget Function(T data) loaded;
  final Widget Function() initial;
  final Widget Function() loading;
  final Widget Function(AppException failure) fail;
  final Widget Function() empty;
  final String? emptyMessage;
  final R stateEnum;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<B, List<CommonState>, CommonState>(
      selector: (state) => state.getState(stateEnum),
      builder: (context, state) => state.when(
        error: (failure) => fail(failure),
        success: (data) => loaded(data),
        initial: () => initial(),
        loading: () => loading(),
        empty: () => empty(),
      ),
    );
  }
}
