import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:Laukita/models/models.dart';
import 'package:Laukita/repositories/repositories.dart';

part 'token_event.dart';
part 'token_state.dart';

class TokenBloc extends Bloc<TokenEvent, TokenState> {
  final TokenRepositories tokenRepositories;
  TokenBloc(this.tokenRepositories) : super(TokenInitial());

  @override
  Stream<TokenState> mapEventToState(
    TokenEvent event,
  ) async* {
    if (event is GenerateToken) {
      yield* _generateToken(event.email, event.password);
    }
  }
  
  Stream<TokenState> _generateToken(String email, String password, {int role}) async*{
    try {
      TokenModel token = await tokenRepositories.generateToken(email, password);
      tokenRepositories.saveToken(token);
      yield TokenLoaded(token);
    } catch (e) {
      yield TokenError(e.toString());
    }
  }
}