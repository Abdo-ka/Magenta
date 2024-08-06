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
import 'package:magenta/features/auth/data/models/verification_model.dart';
import 'package:magenta/features/auth/data/repositories/auth_repositories.dart';

part 'verification_state.dart';

@injectable
class VerificationCubit extends Cubit<VerificationState> {
  final AuthRepositories authRepositories;
  VerificationCubit(this.authRepositories) : super(const VerificationState());
  verification(
      {required VerificationModel param,
      required VoidCallback onSuccess}) async {
    emit(state.copyWith(verifcationStatus: Status.loading));
    final result =
        await authRepositories.verificationRepositories(param: param);
    result.fold(
        (l) => {emit(state.copyWith(verifcationStatus: Status.failure))},
        (r) => {
              emit(state.copyWith(verifcationStatus: Status.success)),
              onSuccess.call(),
              getIt<TokenRepository>().saveToken(r.data!)
            });
  }
}
