import 'package:injectable/injectable.dart';
import 'package:magenta/config/api_routes.dart';
import 'package:magenta/config/types/base_response.dart';
import 'package:core/core.dart';

@injectable
class NotificationRepositories {
  final Client _client;

  NotificationRepositories(this._client);
  FutureResultType<BaseResponse<bool>> getNotificationRepo() async {
    return throwAppException(() async {
      final result = await _client.get(
        ApiRoutes.notifications,
      );
      return result.data.BaseResponse.fromJson(result, (json) => true);
    });
  }
}
