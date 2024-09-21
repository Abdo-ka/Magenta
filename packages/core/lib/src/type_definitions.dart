import 'package:core/src/error/app_exception.dart';
import 'package:either_dart/either.dart';
// typedef Future<T> = Future<Result<T>>;

typedef ParamsMap = Map<String, String?>?;

typedef BodyMap = Map<String, dynamic>;

typedef FutureResultType<T> = Future<Either<AppException, T>>;
