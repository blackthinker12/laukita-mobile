import 'dart:async';

import 'package:Laukita/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(OnInitialPage());

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GoToMainPage) {
      yield OnMainPage(argumentsValue: event.argumentsValue);
    }
    else if (event is GoToOnBoardingPage) {
      yield OnBoardingPageState();
    } 
  }
}
