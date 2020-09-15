import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:Laukita/repositories/repositories.dart';
import 'package:Laukita/models/models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends HydratedBloc<CartEvent, CartState> {
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
      DataCartModel cartProducts;
      try {
        DataCartModel cartProduct = (state as CartLoaded).cartProducts;
        var check = cartProduct.cart.where((productData) => productData.product.pdId == product.pdId);
        if (check.length > 0) {
          CartModel selectedCart = cartProduct.cart.firstWhere((productData) => productData.product.pdId == product.pdId);
          int newQuantity = quantity + selectedCart.productQuantity.quantity;
          cartProducts = cartRepositories.changeQuantity(cartProduct, selectedCart, newQuantity);
          print(cartProducts.toJson());
          yield CartLoaded(cartProducts);
        } else {
          cartProducts = cartRepositories.addProductToCart(cartProduct, product, quantity);
          print(cartProducts.toJson());
          yield CartLoaded(cartProducts);
        }
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

  @override
  CartState fromJson(Map<String, dynamic> json) {
    try {
      final carts = DataCartModel.fromJson(json);
      return CartLoaded(carts);
    } catch (e) {
      return null;
    }
  }
  
  @override
  Map<String, dynamic> toJson(CartState state) {
    if (state is CartLoaded) {
      print('to json CACHE');
      print(state.cartProducts.toJson());
      return state.cartProducts.toJson();
    } else {
       print('to json CACHE ERRRORORORORO');
      return null;
    }
  }
}