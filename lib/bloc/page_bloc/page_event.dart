part of 'page_bloc.dart';

@immutable
abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoToMainPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToOnBoardingPage extends PageEvent {
  @override
  List<Object> get props => [];
}