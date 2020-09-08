part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class GetProducts extends ProductEvent {
  final String token;

  GetProducts(this.token);

  @override
  List<Object> get props => [token];
}