part of 'home_bloc.dart';

abstract class HomeEvent {}

class GetCategoryEvent implements HomeEvent {}

class GetPopularEvent implements HomeEvent {}

class GetOfferEvent implements HomeEvent {}

class InitialHomeEvent implements HomeEvent{}