// 📦 Package imports:
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:core/core.dart';
import 'package:magenta/core/utils/type_defs.dart';

@injectable
abstract class {{feature_name.pascalCase()}}Repository{
  final Client _client;
  {{feature_name.pascalCase()}}Repository(this._client);
//  FutureResultType<type> get() => _client.get(fromJson: (Map<String, dynamic> json) {  });
}