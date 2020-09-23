import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

import 'package:Laukita/models/models.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 3)
class CartModel {
  @HiveField(0)
  DataProductModel product;
  @HiveField(1)
  int quantity;

  int get subtotal => quantity * product.pdPrice;

  CartModel({
    @required this.product,
    @required this.quantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    product: DataProductModel.fromJson(json["product"]),
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "product": product,
    "productQuantity": quantity
  };
}