// 📦 Package imports:
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:magenta/config/api_routes.dart';
import 'package:magenta/config/types/base_response.dart';
import 'package:magenta/core/network/client/client.dart';
import 'package:magenta/core/utils/type_defs.dart';
import 'package:magenta/features/auth/data/models/sign_in_model.dart';
import 'package:magenta/features/auth/data/models/sign_up_model.dart';
import 'package:magenta/features/auth/data/models/verification_model.dart';

@injectable
class AuthRepositories {
  final Client _client;
  AuthRepositories(this._client);
  FutureResult<BaseResponse<String>> signUpRepositories(
          {required SignUpModel param}) =>
      _client.post(ApiRoutes.register,
          fromJson: (json) => BaseResponse(
              data: 'data', message: 'message', code: 200, success: true),
          data: param.toJson());
  FutureResult<BaseResponse<String>> verificationRepositories(
          {required VerificationModel param}) =>
      _client.post(ApiRoutes.verification,
          fromJson: (json) => BaseResponse(
              data: 'Bearer ${json['token']}',
              message: json['message'],
              code: 200,
              success: true),
          data: param.toJson());

  FutureResult<BaseResponse<String>> SignInRepositories(SignInModel param) =>
      _client.post(
        ApiRoutes.login,
        fromJson: (json) => BaseResponse(
            data: 'Bearer ${json['token']}',
            message: json['message'],
            code: 200,
            success: true),
        data: param.toJson(),
      );
}
