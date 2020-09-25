part of 'token_bloc.dart';

abstract class TokenState extends Equatable {
  const TokenState();
}

class TokenInitial extends TokenState {
  @override
  List<Object> get props => [];
}

class TokenError extends TokenState {
  final String message;

  TokenError(this.message);

  @override
  List<Object> get props => [message];
}

class TokenLoaded extends TokenState {
  final TokenModel token;

  TokenLoaded(this.token);

  @override
  List<Object> get props => [token];
}
