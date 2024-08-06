// 📦 Package imports:


// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:magenta/config/common/enum/enums.dart';
import 'package:magenta/features/auth/data/models/sign_up_model.dart';
import 'package:magenta/features/auth/data/repositories/auth_repositories.dart';

part 'sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepositories authRepositories;
  SignUpCubit(this.authRepositories) : super(const SignUpState());
  SignUp({required SignUpModel model, required VoidCallback onSuccess}) async {
    emit(state.copyWith(signUpStatus: Status.loading));
    final result = await authRepositories.signUpRepositories(param: model);
    result.fold(
        (l) => {
              emit(state.copyWith(signUpStatus: Status.failure)),
            },
        (r) => {
              emit(state.copyWith(signUpStatus: Status.success)),
              onSuccess.call()
            });
  }
}
