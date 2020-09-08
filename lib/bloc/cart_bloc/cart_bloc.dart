import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
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
    if (event is AddToCart) {
      yield* _addToCart();
    } else if (event is RemoveFromCart) {
      yield* _removeFromCart(event.item);
    }
  }

  Stream<CartState> _addToCart() {
    try {
      
    } catch (e) {

    }
  }

  Stream<CartState> _removeFromCart(CartModel item) {
    try {
      
    } catch (e) {

    }
  }

  @override
  CartState fromJson(Map<String, dynamic> json) {
    try {
      final cart = CartModel.fromJson(json);
      return null;
      // return CartLoaded();
    } catch (_) {
      return null;
    }
  }
  
  @override
  Map<String, dynamic> toJson(CartState state) {

  }
}
