part of 'repositories.dart';

abstract class TokenRepositories {
  Future<TokenModel> generateToken(String email, String password, {int role});
}

class TokenRepository implements TokenRepositories {
  @override
  Future<TokenModel> generateToken(String email, String password, {int role}) async {
    String url = '$baseUrl/login';

    var response = await http.post(url, body: {
      "email": email,
      "password": password
    });
    
    TokenModel token = TokenModel.tokenModelFromJson(response.body);
    return token;
  }
}