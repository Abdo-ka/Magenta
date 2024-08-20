import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:magenta/config/common/enum/enums.dart';
import 'package:magenta/features/home/data/model/cart_model.dart';
import 'package:magenta/features/home/data/repositories/cart_repositories.dart';

part 'cart_state.dart';

@singleton
class CartCubit extends Cubit<CartState> {
  final CartRepositories cartRepositories;
  CartCubit(this.cartRepositories) : super(const CartState());
  void addToCart({required CartModel item}) {
    final List<CartModel> items = List.from(state.items);
    items.add(item);

    emit(state.copyWith(items: items));
  }

  void removeFromCart({required String productId}) {
    final List<CartModel> items = List.from(state.items);
    items.removeWhere(
      (element) => element.productId == productId,
    );
    emit(state.copyWith(items: items));
  }

  void completePayCart(
      {required List<CartModel> items, required VoidCallback onSuccess}) async {
    emit(state.copyWith(completePayCartStatus: Status.loading));
    final result = await cartRepositories.cartRepositories(items: state.items);
    result.fold(
        (_) => emit(state.copyWith(completePayCartStatus: Status.success,
              items: [],
            )),
        (r) {
      emit(state.copyWith(
        completePayCartStatus: Status.success,
        items: [],
      ));
      onSuccess.call();
    });
  }
}
