part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class GetCartData extends CartEvent {
  @override
  List<Object> get props => [];
}

class CartQuantityChanged extends CartEvent {
  final CartModel item;
  final int newQuantity;

  CartQuantityChanged({this.item, this.newQuantity});

  @override
  List<Object> get props => [item, newQuantity];
}

class AddToCart extends CartEvent {
  final DataProductModel product;
  final int quantity;

  AddToCart({this.product, this.quantity});

  @override
  List<Object> get props => [product, quantity];
}

class RemoveFromCart extends CartEvent {
  final CartModel item;

  RemoveFromCart({this.item});

  @override
  List<Object> get props => [item];
}