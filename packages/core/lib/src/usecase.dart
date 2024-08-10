import 'type_definitions.dart';

abstract class UseCase<T, Params> {
  FutureResultType<T> call(Params params);
}

class NoParams {}
