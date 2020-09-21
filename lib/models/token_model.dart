import 'dart:convert';
import 'package:hive/hive.dart';

part 'token_model.g.dart';

@HiveType(typeId: 0)
class TokenModel {
  TokenModel({
    this.code,
    this.message,
    this.result,
  });

  @HiveField(0)
  int code;
  @HiveField(1)
  String message;
  @HiveField(2)
  ResultTokenModel result;

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    if (json["code"] == 200) {
      return TokenModel(
        code: json["code"],
        message: json["message"],
        result: ResultTokenModel.fromJson(json["result"]),
      );
    }
    else {
      return TokenModel(
        code: json["code"],
        message: json["message"]
      );
    }
  }

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "result": result.toJson(),
  };

  static TokenModel tokenModelFromJson(String str) => TokenModel.fromJson(json.decode(str));
  static String tokenModelToJson(TokenModel data) => json.encode(data.toJson());
}

@HiveType(typeId: 1)
class ResultTokenModel {
  ResultTokenModel({
    this.token,
    this.userId,
    this.userName,
  });

  @HiveField(0)
  String token;
  @HiveField(1)
  int userId;
  @HiveField(2)
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