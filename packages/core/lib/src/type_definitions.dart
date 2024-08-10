import 'package:core/src/error/app_exception.dart';
import 'package:either_dart/either.dart';
// typedef FutureResult<T> = Future<Result<T>>;

typedef FutureResultType<T> = Future<Either<AppException, T>>;
