// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  String message;
  dynamic data;

  Login({required this.message, required this.data});

  factory Login.fromJson(Map<String, dynamic> json) =>
      Login(message: json["message"], data: json["data"]);

  Map<String, dynamic> toJson() => {"message": message, "data": data};
}
