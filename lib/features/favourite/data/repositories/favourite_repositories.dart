// 📦 Package imports:
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:magenta/core/network/client/client.dart';

@injectable
class FavouriteRepositories {
  final Client _client;

  FavouriteRepositories(this._client);
}
