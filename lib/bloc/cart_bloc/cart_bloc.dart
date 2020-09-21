import 'dart:async';

import 'package:equatable/equatable.dart';

import 'package:Laukita/repositories/repositories.dart';
import 'package:Laukita/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepositories cartRepositories;
  CartBloc(this.cartRepositories) : super(CartInitial());

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is GetCartData) {
      yield* _getCartData();
    } else if (event is AddToCart) {
      yield* _addToCart(event.product, event.quantity);
    } else if (event is RemoveFromCart) {
      yield* _removeFromCart(event.item);
    }
  }

  Stream<CartState> _getCartData() async*{
    if (state is CartLoaded) {
      try {
        DataCartModel cartProduct = (state as CartLoaded).cartProducts;
        yield CartLoaded(cartProduct);
      } catch (e) {
        yield CartError(e.toString());
      }
    }
    else {
      yield CartLoading();
    }
  }

  Stream<CartState> _addToCart(DataProductModel product, int quantity) async*{
    if (state is CartLoaded) {
      try {
        DataCartModel cartProducts;
        var copyState = this.state as CartLoaded;
        DataCartModel cartState = copyState.cartProducts;
        var check = cartState.cart.where((productData) => productData.product.pdId == product.pdId);
        if (check.length > 0) {
          CartModel selectedCart = cartState.cart.firstWhere((productData) => productData.product.pdId == product.pdId);
          int newQuantity = quantity + selectedCart.productQuantity.quantity;
          cartProducts = cartRepositories.changeQuantity(cartState, selectedCart, newQuantity);
        } else {
          cartProducts = cartRepositories.addProductToCart(cartState, product, quantity);
        }
        print(copyState.copyWith(cartProducts).cartProducts.toJson());
        yield copyState.copyWith(cartProducts);
      } catch (e) {
        yield CartError(e.toString());
      }
    }
    else {
      try {
        DataCartModel cartProduct = DataCartModel(
          cart: []
        );
        DataCartModel cartProducts = cartRepositories.addProductToCart(cartProduct, product, quantity);
        yield CartLoaded(cartProducts);
      } catch (e) {
        yield CartError(e.toString());
      }
    }
  }

  Stream<CartState> _removeFromCart(CartModel item) async*{
    try {
      
    } catch (e) {
      yield CartError(e.toString());
    }
  }
}