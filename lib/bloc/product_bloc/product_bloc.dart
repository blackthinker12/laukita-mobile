import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:Laukita/models/models.dart';
import 'package:Laukita/repositories/repositories.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepositories productRepositories;
  ProductBloc(this.productRepositories) : super(ProductInitial());

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is GetProducts) {
      yield* _getProducts(event.token);
    }
  }

  Stream<ProductState> _getProducts(String token) async*{
    try {
      ProductModel product = await productRepositories.getProducts(token);
      yield ProductLoaded(product);
    } catch (e) {
      yield ProductError(e.toString());
    }
  }
}
