part of 'models.dart';

class CartModel extends Equatable {
  final DataProductModel product;
  final ProductQuantity productQuantity;

  int get subtotal => productQuantity.quantity * product.pdPrice;

  CartModel({
    @required this.product,
    @required this.productQuantity,
  });

  void changeQuantity(int quantity){
    productQuantity.changeQuantity(quantity);
  }

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    product: json["product"],
    productQuantity: json["productQuantity"],
  );

  @override
  List<Object> get props => [product, productQuantity.quantity];
}

class ProductQuantity {
  int quantity;

  ProductQuantity(this.quantity);

  void changeQuantity(int newQuantity){
    quantity = newQuantity;
  }
}

class DataCartModel extends Equatable {
  final List<CartModel> cart;
  final int totalPrice;

  DataCartModel({
    this.cart,
    this.totalPrice
  });

  @override
  List<Object> get props => [cart, totalPrice];
}