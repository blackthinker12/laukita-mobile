part of 'models.dart';

class Token extends Equatable {
  final String token;
  final int expires;
  final String username;
  final String password;

  Token({this.token, this.expires, this.username, this.password});

  factory Token.convert(Map<String, dynamic> data) {
    if (data['token'] != null) {
      return Token(
        token: data['token'],
        expires: data['expires'],
      );
    }
    return Token();
  }

  Token copyWith({String token, int expires, String password}) =>
    Token(
      token: token ?? this.token,
      expires: expires ?? this.expires,
      username: this.username,
      password: password ?? this.password
    );

  @override
  List<Object> get props => [token, expires, username, password];
}