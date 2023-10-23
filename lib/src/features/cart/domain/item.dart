// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ecommerce_app/src/features/products/domain/product.dart';

/// A product along with a quantity that can be added to an order/cart
class Item {
  const Item({
    required this.productId,
    required this.quantity,
  });
  final ProductID productId;
  final int quantity;

  Item copyWith({
    ProductID? productId,
    int? quantity,
  }) {
    return Item(
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'quantity': quantity,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      productId: map['productId'],
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Item(productId: $productId, quantity: $quantity)';

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.productId == productId && other.quantity == quantity;
  }

  @override
  int get hashCode => productId.hashCode ^ quantity.hashCode;
}
