part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  final List<CartModel> cartProducts;
  final int totalPrice;
  final double calculatedPrice;

  CartLoaded(
    {this.totalPrice,
    this.calculatedPrice,
    @required this.cartProducts});

  CartLoaded copyWith(
      {List<CartModel> cartProducts,
      int totalPrice,
      double calculatedPrice}) {
    return CartLoaded(
        cartProducts: cartProducts ?? this.cartProducts,
        totalPrice: totalPrice ?? this.totalPrice,
        calculatedPrice: calculatedPrice ?? this.calculatedPrice);
  }

  @override
  List<Object> get props => [totalPrice, cartProducts, calculatedPrice];
}

class CartError extends CartState {
  final String message;
  
  CartError(this.message);

  @override
  List<Object> get props => [message];
}