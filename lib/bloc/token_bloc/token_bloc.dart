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
    else if (event is GetToken) {
      yield* _getToken();
    }
  }
  
  Stream<TokenState> _generateToken(String email, String password, {int role}) async*{
    try {
      TokenModel token = await tokenRepositories.generateToken(email, password);
      if (state is TokenLoading) {
        tokenRepositories.saveToken('add', token);
      } else {
        tokenRepositories.saveToken('put', token);
      }
      yield TokenLoaded(token);
    } catch (e) {
      yield TokenError(e.toString());
    }
  }

  Stream<TokenState> _getToken() async*{
    try {
      int count = tokenRepositories.count();
      if (count > 0) {
        TokenModel token = tokenRepositories.getToken();
        yield TokenLoaded(token);
      } else {
        yield TokenLoading();
      }
    } catch (e) {
      yield TokenError(e.toString());
    }
  }
}