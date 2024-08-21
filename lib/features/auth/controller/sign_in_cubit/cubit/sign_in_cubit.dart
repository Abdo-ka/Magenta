// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:magenta/config/common/enum/enums.dart';
import 'package:magenta/core/di/di_container.dart';
import 'package:magenta/core/repositories/token_repository.dart';
import 'package:magenta/features/auth/data/models/sign_in_model.dart';
import 'package:magenta/features/auth/data/repositories/auth_repositories.dart';

part 'sign_in_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  final AuthRepositories authRepositories;
  SignInCubit(this.authRepositories) : super(const SignInState());
  signIn({required SignInModel param, required VoidCallback onSuccess}) async {
    emit(state.copyWith(SignInStatus: Status.loading));
    final result = await authRepositories.SignInRepositories(param);
    result.fold(
        (l) => {emit(state.copyWith(SignInStatus: Status.failure))},
        (r) => {
              print(r.data),
              emit(state.copyWith(SignInStatus: Status.success)),
              getIt<TokenRepository>().saveToken(r.data!),
              onSuccess.call(),
            });
  }
}
