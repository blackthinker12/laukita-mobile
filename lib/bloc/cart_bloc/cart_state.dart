part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  final DataCartModel cartProducts;

  CartLoaded(this.cartProducts);

  @override
  List<Object> get props => [cartProducts];
}

class CartLoading extends CartState {
  const CartLoading();

  @override
  List<Object> get props => [];
}

class CartError extends CartState {
  final String message;
  
  CartError(this.message);

  @override
  List<Object> get props => [message];
}