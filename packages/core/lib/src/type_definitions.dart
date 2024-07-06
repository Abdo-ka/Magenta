import 'package:core/src/error/app_exception.dart';
import 'package:either_dart/either.dart';
// typedef FutureResult<T> = Future<Result<T>>;

typedef FutureResult<T> = Future<Either<AppException, T>>;
