part of 'repositories.dart';

abstract class CatalogRepositories {
  Future<CatalogModel> getCatalogs();
}

class CatalogRepository implements CatalogRepositories {
  @override
  Future<CatalogModel> getCatalogs() async {
    String url = '$baseUrl/catalog/';

    var response = await http.get(url);
    
    CatalogModel catalog = catalogFromJson(response.body);
    
    return catalog;
  }
}