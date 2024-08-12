// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CartModel {
  final String image;
  final String quantity;
  final String productId;
  final String price;
  final String name;
  final String category;

  CartModel({
    required this.image,
    required this.quantity,
    required this.productId,
    required this.price,
    required this.name,
    required this.category,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'quantity': quantity,
      'product_id': productId,
    };
  }
}
