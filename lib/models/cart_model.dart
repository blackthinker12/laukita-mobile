part of 'models.dart';

class DataCartModel {
  List<CartModel> cart;
  int totalPrice;

  DataCartModel({
    this.cart,
    this.totalPrice
  });

  factory DataCartModel.fromJson(Map<String, dynamic> json) {
    List<CartModel> cartResult = decodeCartDatas(json["cart"]);
    return DataCartModel(
      cart: cartResult,
      totalPrice: json["totalPrice"],
    );
  }

  Map<String, dynamic> toJson() => {
    "cart": encodeCartDatas(cart),
    "totalPrice": totalPrice
  };

  static String encodeCartDatas(List<CartModel> cartDatas) => json.encode(
    cartDatas
        .map<Map<String, dynamic>>((cartData) => CartModel.toMap(cartData))
        .toList(),
  );

  static List<CartModel> decodeCartDatas(String cartStr) =>
    (json.decode(cartStr) as List<dynamic>)
        .map<CartModel>((item) => CartModel.fromJson(item))
        .toList();
}

class CartModel {
  DataProductModel product;
  ProductQuantity productQuantity;

  int get subtotal => productQuantity.quantity * product.pdPrice;

  CartModel({
    @required this.product,
    @required this.productQuantity,
  });

  void changeQuantity(int quantity){
    productQuantity.changeQuantity(quantity);
  }

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    product: DataProductModel.fromJson(json["product"]),
    productQuantity: ProductQuantity.fromJson(json["productQuantity"]),
  );

  Map<String, dynamic> toJson() => {
    "product": product,
    "productQuantity": productQuantity.toJson()
  };

  static Map<String, dynamic> toMap(CartModel cart) => {
    "product": cart.product,
    "productQuantity": cart.productQuantity.toJson()
  };
}

class ProductQuantity {
  int quantity;

  ProductQuantity(this.quantity);

  void changeQuantity(int newQuantity){
    quantity = newQuantity;
  }

  factory ProductQuantity.fromJson(Map<String, dynamic> json) => ProductQuantity(
    json["quantity"]
  );

  Map<String, dynamic> toJson() => {
    "quantity": quantity,
  };
}