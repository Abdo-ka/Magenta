// 📦 Package imports:
import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:magenta/config/api_routes.dart';
import 'package:magenta/config/types/base_response.dart';
import 'package:magenta/features/favourite/data/model/favourite_model.dart';

@injectable
class FavouriteRepositories {
  final Client _client;

  FavouriteRepositories(this._client);
  FutureResultType<BaseResponse<FavouriteModel>>
      getFavouriteRepositories() async {
    return throwAppException(() async {
      final result = await _client.get(
        ApiRoutes.favourites,
      );
      return result.data.BaseResponse.fromJson(
        result,
        (json) => FavouriteModel.fromJson(json),
      );
    });
  }

  FutureResultType<bool> addToFavourite({required int id}) async {
    return throwAppException(() async {
      final result = await _client.post(ApiRoutes.favourites, data: {
        'product_id': '$id',
      });
      return result.data['success'];
    });
  }

  FutureResultType<bool> removeFromFavourite({required int id}) async {
    return throwAppException(() async {
      final result = await _client.post(
        'favoritesDelete',
        data: {
          "product_id": "$id",
        },
      );
      return result.data['success'];
    });
  }
}
