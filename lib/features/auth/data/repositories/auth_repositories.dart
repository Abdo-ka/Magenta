// 📦 Package imports:
import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:magenta/config/api_routes.dart';
import 'package:magenta/config/types/base_response.dart';
import 'package:core/core.dart';

import 'package:magenta/features/auth/data/models/sign_in_model.dart';
import 'package:magenta/features/auth/data/models/sign_up_model.dart';
import 'package:magenta/features/auth/data/models/verification_model.dart';

@injectable
class AuthRepositories {
  final Client _client;
  AuthRepositories(this._client);
  FutureResultType<BaseResponse<String>> signUpRepositories(
      {required SignUpModel param}) async {
    return throwAppException(() async {
      final result = await _client.post(
        ApiRoutes.register,
        data: param.toJson(),
      );
      return result.data['data'];
    });
  }

  FutureResultType<BaseResponse<String>> verificationRepositories(
      {required VerificationModel param}) async {
    return throwAppException(() async {
      final result = await _client.post(
        ApiRoutes.verification,
        data: param.toJson(),
      );
      return result.data.BaseResponse
          .fromJson(result.data, (json) => 'Bearer ${json['data']['token']}');
    });
  }

  FutureResultType<BaseResponse<String>> SignInRepositories(
      SignInModel param) async {
    return throwAppException(() async {
      final result = await _client.post(
        ApiRoutes.login,
        data: param.toJson(),
      );
      return result.data.BaseResponse
          .fromJson(result.data, (json) => 'Bearer ${json['data']['token']}');
    });
  }
}
