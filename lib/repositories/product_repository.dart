part of 'repositories.dart';

abstract class ProductRepositories {
  Future<ProductModel> getProducts(String token);
}

class ProductRepository implements ProductRepositories {
  @override
  Future<ProductModel> getProducts(String token) async {
    String url = '$baseUrl/product?token=$token';

    var response = await http.get(url);
    ProductModel product = productModelFromJson(response.body);
    return product;
  }
}