part of 'repositories.dart';

abstract class CartRepositories {
  int count(Box cartBox);
  void addProductToCart(Box cartBox, DataProductModel product, int quantity);
  int getTotalPrice(Box cartBox);
  int getSubtotalPrice(int productPrice, int quantity);
  List getCarts(Box cartBox);
  void changeQuantity(Box cartBox, DataProductModel product, int index, int newQuantity);
  //Future getCalculatedPrice();
}

class CartRepository implements CartRepositories {
  @override
  int count(Box cartBox) {
    int count = cartBox.length;
    return count;
  }

  @override
  void addProductToCart(Box cartBox, DataProductModel product, int quantity) {
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
        }
        else {
          CartModel selectedList = cartList.firstWhere((el) => el.product.pdId == product.pdId);
          int i = cartList.indexOf(selectedList);
          int newQuantity = quantity + cartList[i].quantity;
          CartModel updatedCart = CartModel(product: product, quantity: newQuantity);
          cartBox.putAt(i, updatedCart);
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

  @override
  int getTotalPrice(Box cartBox) {
    int totalPrice = 0;
    Map<dynamic, dynamic> raw = cartBox.toMap();
    List cartData = raw.values.toList();
    for (var i = 0; i < cartData.length; i++) {
      totalPrice += cartData[i].subtotal;
    }
    return totalPrice;
  }

  @override
  int getSubtotalPrice(int productPrice, int quantity) {
    int subtotalPrice = productPrice * quantity;
    return subtotalPrice;
  }

  @override
  List getCarts(Box cartBox) {
    Map<dynamic, dynamic> raw = cartBox.toMap();
    List cartList = raw.values.toList();
    return cartList;
  }

  @override
  void changeQuantity(Box cartBox, DataProductModel product, int index, int newQuantity) {
    CartModel updatedCart = CartModel(product: product, quantity: newQuantity);
    cartBox.putAt(index, updatedCart);
  }
}