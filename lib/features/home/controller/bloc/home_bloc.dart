// 🎯 Dart imports:
import 'dart:async';

// 📦 Package imports:
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:magenta/config/common/enum/enums.dart';
import 'package:magenta/features/home/data/model/category_model.dart';
import 'package:magenta/features/home/data/model/offer_model.dart';
import 'package:magenta/features/home/data/model/products_model.dart';
import 'package:magenta/features/home/data/repositories/home_repositories.dart';

// 🌎 Project imports:


part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepositories homeRepositories;
  HomeBloc(this.homeRepositories) : super(const HomeState()) {
    on<InitialHomeEvent>(_initialHomeEvent);
    on<GetCategoryEvent>(_getCategoryEvent,
        transformer: concurrent<GetCategoryEvent>());
    on<GetPopularEvent>(_getPopularevent,
        transformer: concurrent<GetPopularEvent>());
    on<GetOfferEvent>(_getOfferEvent, transformer: concurrent<GetOfferEvent>());
  }
  FutureOr<void> _initialHomeEvent(
      InitialHomeEvent event, Emitter<HomeState> emit) async {
    add(GetCategoryEvent());
    add(GetPopularEvent());
    add(GetOfferEvent());
  }

  FutureOr<void> _getOfferEvent(
      GetOfferEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(offerStatus: Status.loading));
    final result = await homeRepositories.offerRepositories();
    result.fold(
      (l) => {emit(state.copyWith(offerStatus: Status.failure))},
      (r) => {
        emit(
          state.copyWith(offerStatus: Status.success),
        ),
      },
    );
  }

  FutureOr<void> _getCategoryEvent(
      GetCategoryEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(categoryStatus: Status.loading));
    final result = await homeRepositories.categoryRepositories();
    result.fold(
        (l) => emit(state.copyWith(categoryStatus: Status.failure)),
        (r) => emit(state.copyWith(
              categoryStatus: Status.success,
              category: r.data,
            )));
  }

  FutureOr<void> _getPopularevent(
      GetPopularEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(popularStatus: Status.loading));
    final result = await homeRepositories.ProductsRepositories();
    result.fold(
        (l) => {emit(state.copyWith(popularStatus: Status.failure))},
        (r) => {
              emit(state.copyWith(
                popularStatus: Status.success,
                products: r.data,
              ))
            });
  }
}
