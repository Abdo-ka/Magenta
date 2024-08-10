// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  final Status FavouriteStatus;
  final FavouriteModel favouriteModel;
  const FavoriteState({
    this.FavouriteStatus = Status.initial,
    this.favouriteModel= const FavouriteModel(),
  });

  @override
  List<Object> get props => [
        FavouriteStatus,
        favouriteModel,
      ];

  FavoriteState copyWith({
    Status? FavouriteStatus,
    FavouriteModel? favouriteModel,
  }) {
    return FavoriteState(
      FavouriteStatus: FavouriteStatus ?? this.FavouriteStatus,
      favouriteModel: favouriteModel ?? this.favouriteModel,
    );
  }
}
