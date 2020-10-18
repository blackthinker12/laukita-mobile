part of 'catalog_bloc.dart';

abstract class CatalogEvent extends Equatable {
  const CatalogEvent();
}

class GetCatalogs extends CatalogEvent {
  final String perPage;
  final String page;

  GetCatalogs({this.perPage, this.page});

  @override
  List<Object> get props => [perPage, page];
}