part of 'home_bloc.dart';

abstract class HomeEvent {}

class GetCategoryEvent implements HomeEvent {}

class GetPopularEvent implements HomeEvent {}

class GetOfferEvent implements HomeEvent {}

class GetSignalProductEvent implements HomeEvent {
  final int id;

  GetSignalProductEvent({
    required this.id,
  });
}

class GetFavouriteEvent implements HomeEvent {}

class AddFavouriteEvent implements HomeEvent {
  final int id;

  AddFavouriteEvent({
    required this.id,
  });
}

class RemoveFavouriteEvent implements HomeEvent {
  final int id;

  RemoveFavouriteEvent({required this.id});
}

class InitialHomeEvent implements HomeEvent {}
