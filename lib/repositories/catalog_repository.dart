part of 'repositories.dart';

abstract class CatalogRepositories {
  Future<CatalogModel> getCatalogs({String perPage, String page});
}

class CatalogRepository implements CatalogRepositories {
  @override
  Future<CatalogModel> getCatalogs({String perPage, String page}) async {
    String url;
    if (perPage == null) {
      url = '$baseUrl/catalog';
    } else {
      if (page == null) {
        url = '$baseUrl/catalog?per_page=$perPage&page=1';
      } else {
        url = '$baseUrl/catalog?per_page=$perPage&page=$page';
      }
    }

    var response = await http.get(url);
    
    CatalogModel catalog = catalogFromJson(response.body);
    
    return catalog;
  }
}