part of 'models.dart';

class ProductModel extends Equatable {
  final String title;
  final int price;

  ProductModel({this.title, this.price});

  @override
  List<Object> get props => [title, price];
}