part of 'catalog_bloc.dart';

abstract class CatalogEvent extends Equatable {
  const CatalogEvent();
}

class GetCatalogs extends CatalogEvent {
  GetCatalogs();

  @override
  List<Object> get props => [];
}