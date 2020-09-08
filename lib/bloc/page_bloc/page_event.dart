part of 'page_bloc.dart';

@immutable
abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoToMainPage extends PageEvent {
  final ScreenArgumentsModel argumentsValue;

  GoToMainPage({this.argumentsValue});

  @override
  List<Object> get props => [argumentsValue];
}

class GoToOnBoardingPage extends PageEvent {
  @override
  List<Object> get props => [];
}