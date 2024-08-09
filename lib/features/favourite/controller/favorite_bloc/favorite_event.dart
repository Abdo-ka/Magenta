part of 'favorite_bloc.dart';

abstract class FavoriteEvent {}

class GetFavouriteEvent implements FavoriteEvent {}

class AddToFavouriteEvent implements FavoriteEvent {
  final int product_id;

  AddToFavouriteEvent({
    required this.product_id,
  });
}

class RemoveFromFavouriteEvent implements FavoriteEvent {
  final int product_id;

  RemoveFromFavouriteEvent({
    required this.product_id,
  });
}
