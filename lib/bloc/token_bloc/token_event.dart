part of 'token_bloc.dart';

abstract class TokenEvent extends Equatable {
  const TokenEvent();
}

class GenerateToken extends TokenEvent {
  final String email;
  final String password;
  final int role;
  
  GenerateToken(this.email, this.password, {this.role});

  @override
  List<Object> get props => [email, password, role];
}