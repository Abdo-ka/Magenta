// 📦 Package imports:
import 'package:dartz/dartz.dart';

// 🌎 Project imports:
import 'package:magenta/config/types/app_exception.dart';

typedef ParamsMap = Map<String, String?>?;

typedef BodyMap = Map<String, dynamic>;

typedef FutureResult<T> = Future<Either<AppException, T>>;
