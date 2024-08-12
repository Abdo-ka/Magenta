// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_cubit.dart';

class CartState extends Equatable {
  final List<CartModel> items;
  final Status completePayCartStatus;
  const CartState({
    this.items = const [],
    this.completePayCartStatus = Status.initial,
  });

  @override
  List<Object> get props => [
        items,
        completePayCartStatus,
      ];

  CartState copyWith({
    List<CartModel>? items,
    Status? completePayCartStatus,
  }) {
    return CartState(
      items: items ?? this.items,
      completePayCartStatus: completePayCartStatus ?? this.completePayCartStatus,
    );
  }
}
