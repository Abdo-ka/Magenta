// 📦 Package imports:
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:magenta/config/api_routes.dart';
import 'package:magenta/config/types/types.dart';
import 'package:core/core.dart';
import 'package:magenta/features/home/data/model/cart_model.dart';
import 'package:magenta/features/home/data/model/products_model.dart';

@injectable
class CartRepositories {
  final Client _client;

  CartRepositories(this._client);
  FutureResultType<BaseResponse<ProductsModel>> cartRepositories(
      {required List<CartModel> items}) async {
    return throwAppException(() async {
      final result = await _client.post(
        ApiRoutes.products,
        data: items.map((e) => e.toJson()).toList(),
      );
      return result.data.BaseResponse
          .fromJson(result, (json) => ProductsModel.fromJson(json));
    });
  }
}
