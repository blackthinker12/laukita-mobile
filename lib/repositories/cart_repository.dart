part of 'repositories.dart';

abstract class CartRepositories {
  DataCartModel addProductToCart(DataCartModel cartData, DataProductModel product, int quantity);
  DataCartModel changeQuantity(DataCartModel cartData, CartModel item, int newQuantity);
  DataCartModel getTotalPrice(DataCartModel cartData);
  //Future getCalculatedPrice();
}

class CartRepository implements CartRepositories {
  var cartBox = Hive.box("cart");

  @override
  DataCartModel addProductToCart(DataCartModel cartData, DataProductModel product, int quantity) {
    cartData.cart.add(
      CartModel(
        product: product,
        productQuantity: ProductQuantity(quantity), 
      )
    );
    return cartData;
  }

  @override
  DataCartModel changeQuantity(DataCartModel cartData, CartModel item, int newQuantity) {
    for(int i = 0; i < cartData.cart.length; i++){
      if (cartData.cart[i] == item ) {
        cartData.cart[i].productQuantity.changeQuantity(newQuantity);
      }
    }
    return cartData;
  }

  @override
  DataCartModel getTotalPrice(DataCartModel cartData) {
    int totalPrice = 0;
    for (var i = 0; i < cartData.cart.length; i++) {
      totalPrice += cartData.cart[i].subtotal;
    }
    cartData.totalPrice = totalPrice;
    return cartData;
  }

  // @override
  // Future getCalculatedPrice() {

  // }
}