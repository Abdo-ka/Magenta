// 📦 Package imports:
import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:magenta/config/api_routes.dart';
import 'package:magenta/config/types/base_response.dart';

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
