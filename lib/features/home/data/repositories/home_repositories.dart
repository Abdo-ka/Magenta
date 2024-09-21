// 📦 Package imports:
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:magenta/config/api_routes.dart';
import 'package:magenta/config/types/types.dart';
import 'package:core/core.dart';
import 'package:magenta/features/home/data/model/category_model.dart';
import 'package:magenta/features/home/data/model/offer_model.dart';
import 'package:magenta/features/home/data/model/products_model.dart';
import 'package:magenta/features/home/data/model/signal_product_mode.dart';

@injectable
class HomeRepositories {
  final Client _client;

  HomeRepositories(this._client);
  FutureResultType<BaseResponse<ProductsModel>> ProductsRepositories() async {
    return throwAppException(() async {
      final result = await _client.get(
        ApiRoutes.products,
      );
      return result.data.BaseResponse.fromJson(
        result,
        (json) => ProductsModel.fromJson(json),
      );
    });
  }

  FutureResultType<BaseResponse<OfferModel>> offerRepositories(
      {int? offerId}) async {
    return throwAppException(() async {
      final result = await _client.get(
        ApiRoutes.offers,
      );
      return result.data.BaseResponse.fromJson(
        result,
        (json) => OfferModel.fromJson(json),
      );
    });
  }

  FutureResultType<BaseResponse<CategoryModel>> categoryRepositories() async {
    return throwAppException(() async {
      final result = await _client.get(
        ApiRoutes.categories,
      );
      return result.data.BaseResponse.fromJson(
        result,
        (json) => CategoryModel.fromJson(json),
      );
    });
  }

  FutureResultType<BaseResponse<SignleProductModel>>
      getSignalProductRepositories({required int id}) async {
    return throwAppException(() async {
      final result = await _client.get(
        ApiRoutes.signalProduct(id),
      );
      return result.data.BaseResponse.fromJson(
        result,
        (json) => SignleProductModel.fromJson(json),
      );
    });
  }
}
