// 🎯 Dart imports:
import 'dart:async';

// 📦 Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:magenta/config/common/enum/enums.dart';
import 'package:magenta/features/favourite/data/model/favourite_model.dart';
import 'package:magenta/features/favourite/data/repositories/favourite_repositories.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

@injectable
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavouriteRepositories favouriteRepositories;
  FavoriteBloc(this.favouriteRepositories) : super(const FavoriteState()) {
    on<GetFavouriteEvent>(_getFavouriteEvent);
  }
  FutureOr<void> _getFavouriteEvent(
      GetFavouriteEvent event, Emitter<FavoriteState> emit) async {
    emit(state.copyWith(FavouriteStatus: Status.loading));
    final result = await favouriteRepositories.getFavouriteRepositories();
    result.fold(
        (l) => {emit(state.copyWith(FavouriteStatus: Status.failure))},
        (r) => {
              emit(state.copyWith(
                  FavouriteStatus: Status.success, favouriteModel: r.data))
            });
  }
}
