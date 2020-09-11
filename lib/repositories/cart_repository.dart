part of 'repositories.dart';

abstract class CartRepositories {
  Future addProductToCart(DataProductModel product, int quantity);
  Future changeQuantity(CartModel item, int newQuantity);
  int getTotalPrice();
  //Future getCalculatedPrice();
}

class CartRepository implements CartRepositories {
  static DataCartModel cartData = DataCartModel();

  @override
  Future addProductToCart(DataProductModel product, int quantity) async {
    cartData.cart.add(
      CartModel(
        product: product,
        productQuantity: ProductQuantity(quantity), 
      )
    );
  }

  @override
  Future changeQuantity(CartModel item, int newQuantity) async {
    for(int i = 0; i < cartData.cart.length; i++){
      if (cartData.cart[i] == item ) {
        cartData.cart[i].productQuantity.changeQuantity(newQuantity);
      }
    }
  }

  @override
  int getTotalPrice() {
    int totalPrice = 0;
    for (var i = 0; i < cartData.cart.length; i++) {
      totalPrice += cartData.cart[i].subtotal;
    }
    return totalPrice;
  }

  // @override
  // Future getCalculatedPrice() {

  // }
}