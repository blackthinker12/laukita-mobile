import 'package:flutter/widgets.dart';

class ProductDetailModel {
  final String name;
  final int quantity;
  final String unit;
  final int price;
  final String imageUrl;
  bool selected;

  ProductDetailModel({
    @required this.name,
    @required this.quantity,
    @required this.unit,
    @required this.price,
    @required this.imageUrl,
    this.selected = false,
  });
}