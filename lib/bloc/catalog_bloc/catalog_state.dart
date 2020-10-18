part of 'catalog_bloc.dart';

abstract class CatalogState extends Equatable {
  const CatalogState();
  
  @override
  List<Object> get props => [];
}

class CatalogInitial extends CatalogState {
  @override
  List<Object> get props => [];
}

class CatalogError extends CatalogState {
  final String message;

  CatalogError(this.message);

  @override
  List<Object> get props => [message];
}

class CatalogLoaded extends CatalogState {
  final CatalogModel catalogs;

  CatalogLoaded(this.catalogs);

  @override
  List<Object> get props => [catalogs];
}