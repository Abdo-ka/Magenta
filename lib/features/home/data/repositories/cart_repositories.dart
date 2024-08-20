// 📦 Package imports:
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:magenta/config/api_routes.dart';
import 'package:magenta/config/types/types.dart';
import 'package:magenta/core/network/client/client.dart';
import 'package:magenta/core/utils/type_defs.dart';
import 'package:magenta/features/home/data/model/cart_model.dart';
import 'package:magenta/features/home/data/model/products_model.dart';

@injectable
class CartRepositories {
  final Client _client;

  CartRepositories(this._client);
  FutureResult<BaseResponse<ProductsModel>> cartRepositories(
          {required List<CartModel> items}) =>
      _client.post(
        ApiRoutes.products,
        data: items.map((e) => e.toJson()).toList(),
        fromJson: (json) => BaseResponse.fromJson(
          json,
          (json) => ProductsModel.fromJson(json),
        ),
      );
}
