part of 'models.dart';

class Product {
  final String name;
  final int quantity;
  final String unit;
  final int price;
  final String imageUrl;
  bool selected;
  Product({
    @required this.name,
    @required this.quantity,
    @required this.unit,
    @required this.price,
    @required this.imageUrl,
    this.selected = false,
  });
}