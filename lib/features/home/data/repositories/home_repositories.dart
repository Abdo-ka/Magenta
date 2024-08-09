// 📦 Package imports:
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:magenta/config/api_routes.dart';
import 'package:magenta/config/types/types.dart';
import 'package:magenta/core/network/client/client.dart';
import 'package:magenta/core/utils/type_defs.dart';
import 'package:magenta/features/home/data/model/category_model.dart';
import 'package:magenta/features/home/data/model/offer_model.dart';
import 'package:magenta/features/home/data/model/products_model.dart';

@injectable
class HomeRepositories {
  final Client _client;

  HomeRepositories(this._client);
  FutureResult<BaseResponse<ProductsModel>> ProductsRepositories(
          {int? productId}) =>
      _client.get(
        ApiRoutes.products,
        fromJson: (json) => BaseResponse.fromJson(
          json,
          (json) => ProductsModel.fromJson(json),
        ),
      );
  FutureResult<BaseResponse<OfferModel>> offerRepositories({int? offerId}) =>
      _client.get(
        ApiRoutes.categories,
        fromJson: (json) => BaseResponse.fromJson(
          json,
          (json) => OfferModel.fromJson(json),
        ),
      );
  FutureResult<BaseResponse<CategoryModel>> categoryRepositories() =>
      _client.get(
        ApiRoutes.categories,
        fromJson: (json) => BaseResponse.fromJson(
          json,
          (json) => CategoryModel.fromJson(json),
        ),
      );
}
