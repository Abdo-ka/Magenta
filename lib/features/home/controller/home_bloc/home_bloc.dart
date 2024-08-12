// 🎯 Dart imports:
import 'dart:async';

// 📦 Package imports:
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:magenta/config/common/enum/enums.dart';
import 'package:magenta/features/favourite/data/repositories/favourite_repositories.dart';
import 'package:magenta/features/home/data/model/category_model.dart';
import 'package:magenta/features/home/data/model/offer_model.dart';
import 'package:magenta/features/home/data/model/products_model.dart';
import 'package:magenta/features/home/data/model/products_model.dart';
import 'package:magenta/features/home/data/model/products_model.dart';
import 'package:magenta/features/home/data/model/signal_product_mode.dart';
import 'package:magenta/features/home/data/repositories/home_repositories.dart';

// 🌎 Project imports:

part 'home_event.dart';
part 'home_state.dart';

@singleton
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepositories homeRepositories;
  final FavouriteRepositories favouriteRepositories;
  HomeBloc(this.homeRepositories, this.favouriteRepositories)
      : super(const HomeState()) {
    on<InitialHomeEvent>(_initialHomeEvent, transformer: droppable());
    on<GetCategoryEvent>(_getCategoryEvent);
    on<GetPopularEvent>(_getPopularevent);
    on<GetFavouriteEvent>(_getFavouriteEvent, transformer: droppable());
    on<GetSignalProductEvent>(_getSignalProductEvent);
    on<AddFavouriteEvent>(_addFavouriteEvent);
    on<RemoveFavouriteEvent>(_removeFavouriteEvent);
    on<GetOfferEvent>(_getOfferEvent);
  }
  FutureOr<void> _initialHomeEvent(
      InitialHomeEvent event, Emitter<HomeState> emit) async {
    add(GetCategoryEvent());
    // add(GetFavouriteEvent());
    add(GetPopularEvent());
    add(GetOfferEvent());
  }

  FutureOr<void> _addFavouriteEvent(
      AddFavouriteEvent event, Emitter<HomeState> emit) {
    List<int> favourite = List.from(state.Favourite);
    favourite.add(event.id);
    // state.copyWith(Favourite: favourite);
    emit(state.copyWith(Favourite: favourite));
    // print("Favourite updated: $favourite");
  }

  FutureOr<void> _removeFavouriteEvent(
      RemoveFavouriteEvent evnet, Emitter<HomeState> emit) {
    List<int> favourite = List.from(state.Favourite);
    favourite.remove(evnet.id);
    emit(state.copyWith(Favourite: favourite));
    // result.fold((l) {
    //   favourite = state.Favourite;
    //   favourite.add(evnet.id);
    //   emit(state.copyWith(Favourite: favourite));
    // }, (_) => {});
  }

  FutureOr<void> _getFavouriteEvent(
      GetFavouriteEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(categoryStatus: Status.loading));
    final result = await favouriteRepositories.getFavouriteRepositories();
    result.fold(
        (_) => {},
        (r) => {
              emit(state.copyWith(
                  Favourite:
                      r.data?.favorites?.data?.map((e) => e.id ?? 0).toList())),
              add(InitialHomeEvent())
            });
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

  FutureOr<void> _getSignalProductEvent(
      GetSignalProductEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(signalProductsStatus: Status.loading));
    final result =
        await homeRepositories.getSignalProductRepositories(id: event.id);
    result.fold(
        (l) => {emit(state.copyWith(signalProductsStatus: Status.failure))},
        (r) => {
              emit(
                state.copyWith(
                  signalProductsStatus: Status.success,
                  signalProduct: r.data,
                ),
              ),
            });
  }
}
