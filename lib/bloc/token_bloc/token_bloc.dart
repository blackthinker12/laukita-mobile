import 'dart:async';

import 'package:equatable/equatable.dart';

import 'package:Laukita/models/models.dart';
import 'package:Laukita/repositories/repositories.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'token_event.dart';
part 'token_state.dart';

class TokenBloc extends HydratedBloc<TokenEvent, TokenState> {
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
      yield TokenLoaded(token);
    } catch (e) {
      yield TokenError(e.toString());
    }
  }

  Stream<TokenState> _getToken() async*{
    if (state is TokenLoaded) {
      try {
        TokenModel token = (state as TokenLoaded).token;
        yield TokenLoaded(token);
      } catch (e) {
        yield TokenError(e.toString());
      }
    }
    else {
      yield TokenLoading();
    }
  }

  @override
  TokenState fromJson(Map<String, dynamic> json) {
    try {
      final token = TokenModel.fromJson(json);
      return TokenLoaded(token);
    } catch (_) {
      return null;
    }
  }
  
  @override
  Map<String, dynamic> toJson(TokenState state) {
    if (state is TokenLoaded) {
      return state.token.toJson();
    } else {
      return null;
    }
  }
}