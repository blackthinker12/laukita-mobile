import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:Laukita/models/models.dart';
import 'package:Laukita/repositories/repositories.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final CatalogRepositories catalogRepositories;
  CatalogBloc(this.catalogRepositories) : super(CatalogInitial());

  @override
  Stream<CatalogState> mapEventToState(
    CatalogEvent event,
  ) async* {
    if (event is GetCatalogs) {
      yield* _getCatalogs();
    }
  }

  Stream<CatalogState> _getCatalogs() async*{
    try {
      CatalogModel catalogs = await catalogRepositories.getCatalogs();
      yield CatalogLoaded(catalogs);
    } catch (e) {
      yield CatalogError(e.toString());
    }
  }
}
