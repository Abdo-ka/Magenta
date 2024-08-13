// 📦 Package imports:
import 'package:injectable/injectable.dart';
import 'package:magenta/config/api_routes.dart';
import 'package:magenta/config/types/base_response.dart';

// 🌎 Project imports:
import 'package:magenta/core/network/client/client.dart';
import 'package:magenta/core/utils/type_defs.dart';
import 'package:magenta/features/favourite/data/model/favourite_model.dart';

@injectable
class FavouriteRepositories {
  final Client _client;

  FavouriteRepositories(this._client);
  FutureResult<BaseResponse<FavouriteModel>> getFavouriteRepositories() =>
      _client.get(
        ApiRoutes.favourites,
        fromJson: (json) => BaseResponse.fromJson(
          json,
          (json) => FavouriteModel.fromJson(json),
        ),
      );

  FutureResult<bool> addToFavourite({required int id}) => _client.post(
        ApiRoutes.favourites,
        fromJson: (json) => true,
        data: {"product_id": "$id"},
      );
  FutureResult<bool> removeFromFavourite({required int id}) => _client.post(
        'favoritesDelete',
        fromJson: (json) => true,
        data: {
          "product_id": "$id",
        },
      );
}
