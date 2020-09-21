import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

import 'package:Laukita/models/models.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 2)
class DataCartModel {
  @HiveField(0)
  List<CartModel> cart;
  @HiveField(1)
  int totalPrice;

  DataCartModel({
    this.cart,
    this.totalPrice
  });

  factory DataCartModel.fromJson(Map<String, dynamic> json) {
    return DataCartModel(
      cart: decodeCartDatas(json["cart"]),
      totalPrice: json["totalPrice"],
    );
  }

  Map<String, dynamic> toJson() => {
    "cart": encodeCartDatas(cart),
    "totalPrice": totalPrice
  };

  static encodeCartDatas(List<CartModel> cartDatas) => json.encode(
    cartDatas
      .map<Map<String, dynamic>>((cartData) => CartModel.toMap(cartData))
      .toList()
  );

  static List<CartModel> decodeCartDatas(String cartStr) =>
    (json.decode(cartStr) as List<dynamic>)
        .map<CartModel>((item) => CartModel.fromJson(item))
        .toList();
}

@HiveType(typeId: 3)
class CartModel {
  @HiveField(0)
  DataProductModel product;
  @HiveField(1)
  ProductQuantity productQuantity;

  int get subtotal => productQuantity.quantity * product.pdPrice;

  CartModel({
    @required this.product,
    @required this.productQuantity,
  });

  void changeQuantity(int quantity){
    productQuantity.changeQuantity(quantity);
  }

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    product: DataProductModel.fromJson(json["product"]),
    productQuantity: ProductQuantity.fromJson(json["productQuantity"]),
  );

  Map<String, dynamic> toJson() => {
    "product": product,
    "productQuantity": productQuantity.toJson()
  };

  static Map<String, dynamic> toMap(CartModel cart) => {
    "product": cart.product,
    "productQuantity": cart.productQuantity.toJson()
  };
}

@HiveType(typeId: 4)
class ProductQuantity {
  @HiveField(0)
  int quantity;

  ProductQuantity(this.quantity);

  void changeQuantity(int newQuantity){
    quantity = newQuantity;
  }

  factory ProductQuantity.fromJson(Map<String, dynamic> json) => ProductQuantity(
    json["quantity"]
  );

  Map<String, dynamic> toJson() => {
    "quantity": quantity,
  };
}