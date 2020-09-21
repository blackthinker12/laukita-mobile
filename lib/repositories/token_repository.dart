part of 'repositories.dart';

abstract class TokenRepositories {
  Future<TokenModel> generateToken(String email, String password, {int role});
  int count();
  TokenModel getToken();
  void saveToken(String method, TokenModel tokenValue);
}

class TokenRepository implements TokenRepositories {
  var tokens = Hive.box("token");

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

  @override
  int count() {
    int count = tokens.length;
    return count;
  }

  @override
  TokenModel getToken() {
    var token = tokens.getAt(0);
    return token;
  }
  
  @override
  void saveToken(String method, TokenModel tokenValue) {
    try {
      if (method == 'put') {
        tokens.putAt(0, tokenValue);
      } else {
        tokens.add(tokenValue);
      }
    } catch (_) {}
  }
}