import 'package:injectable/injectable.dart';
import 'package:magenta/config/api_routes.dart';
import 'package:magenta/config/types/base_response.dart';
import 'package:magenta/core/network/client/client.dart';
import 'package:magenta/core/utils/type_defs.dart';

@injectable
class NotificationRepositories {
  final Client _client;

  NotificationRepositories(this._client);
  FutureResult<BaseResponse<bool>> getNotificationRepo() =>
      _client.get(ApiRoutes.notifications,
          fromJson: (json) => BaseResponse.fromJson(json, (json) => true));
}
