part of 'page_bloc.dart';

@immutable
abstract class PageState extends Equatable {
  const PageState();
}

class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMainPage extends PageState {
  final ScreenArgumentsModel argumentsValue;

  OnMainPage({this.argumentsValue});

  @override
  List<Object> get props => [argumentsValue];
}

class OnBoardingPageState extends PageState {
  @override
  List<Object> get props => [];
}