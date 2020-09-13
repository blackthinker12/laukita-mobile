part of 'models.dart';

class TokenModel extends Equatable {
  TokenModel({
    this.code,
    this.message,
    this.result,
  });

  final int code;
  final String message;
  final ResultTokenModel result;

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
    code: json["code"],
    message: json["message"],
    result: ResultTokenModel.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "result": result.toJson(),
  };

  static TokenModel tokenModelFromJson(String str) => TokenModel.fromJson(json.decode(str));
  static String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

  @override
  List<Object> get props => [code, message, result];
}

class ResultTokenModel {
  ResultTokenModel({
    this.token,
    this.userId,
    this.userName,
  });

  String token;
  int userId;
  String userName;

  factory ResultTokenModel.fromJson(Map<dynamic, dynamic> json) => ResultTokenModel(
    token: json["token"],
    userId: json["user_id"],
    userName: json["user_name"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user_id": userId,
    "user_name": userName,
  };
}