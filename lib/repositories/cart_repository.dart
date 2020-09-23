part of 'repositories.dart';

abstract class CartRepositories {
  int count();
  void addProductToCart(DataProductModel product, int quantity);
  // var changeQuantity(var cartData, CartModel item, int newQuantity);
  // var getTotalPrice(var cartData);
  //Future getCalculatedPrice();
}

class CartRepository implements CartRepositories {
  var cartBox = Hive.box("cart");

  @override
  int count() {
    int count = cartBox.length;
    return count;
  }

  @override
  void addProductToCart(DataProductModel product, int quantity) {
    try {
      if (cartBox.isNotEmpty) {
        Map<dynamic, dynamic> raw = cartBox.toMap();
        List cartList = raw.values.toList();
        var check = cartList.where((productData) => productData.product.pdId == product.pdId);
        if (check.length < 1) {
          cartBox.add(
            CartModel(
              product: product,
              quantity: quantity, 
            )
          );
          Map<dynamic, dynamic> rawa = cartBox.toMap();
          List cartLista = rawa.values.toList();
          cartLista.forEach((a) => print(a.toJson()));
        }
        else {
          CartModel selectedList = cartList.firstWhere((el) => el.product.pdId == product.pdId);
          int i = cartList.indexOf(selectedList);
          int newQuantity = quantity + cartList[i].quantity;
          CartModel updatedCart = CartModel(product: product, quantity: newQuantity);
          cartBox.putAt(i, updatedCart);
          Map<dynamic, dynamic> rawa = cartBox.toMap();
          List cartLista = rawa.values.toList();
          cartLista.forEach((a) => print(a.toJson()));
        }
      } else {
        cartBox.add(
          CartModel(
            product: product,
            quantity: quantity,
          )
        );
      }
      
    } catch (e) {
      print(e.toString());
    }
  }

  // @override
  // var changeQuantity(var cartData, CartModel item, int newQuantity) {
  //   for(int i = 0; i < cartData.cart.length; i++){
  //     if (cartData.cart[i] == item ) {
  //       cartData.cart[i].productQuantity.changeQuantity(newQuantity);
  //     }
  //   }
  //   return cartData;
  // }

  // @override
  // var getTotalPrice(var cartData) {
  //   int totalPrice = 0;
  //   for (var i = 0; i < cartData.cart.length; i++) {
  //     totalPrice += cartData.cart[i].subtotal;
  //   }
  //   cartData.totalPrice = totalPrice;
  //   return cartData;
  // }

  // @override
  // Future getCalculatedPrice() {

  // }
}