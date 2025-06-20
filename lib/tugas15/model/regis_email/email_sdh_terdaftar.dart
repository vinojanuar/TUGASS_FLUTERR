// To parse this JSON data, do
//
//     final regis = regisFromJson(jsonString);

import 'dart:convert';

Regis regisFromJson(String str) => Regis.fromJson(json.decode(str));

String regisToJson(Regis data) => json.encode(data.toJson());

class Regis {
  String message;
  Errors errors;

  Regis({required this.message, required this.errors});

  factory Regis.fromJson(Map<String, dynamic> json) =>
      Regis(message: json["message"], errors: Errors.fromJson(json["errors"]));

  Map<String, dynamic> toJson() => {
    "message": message,
    "errors": errors.toJson(),
  };
}

class Errors {
  List<String> email;

  Errors({required this.email});

  factory Errors.fromJson(Map<String, dynamic> json) =>
      Errors(email: List<String>.from(json["email"].map((x) => x)));

  Map<String, dynamic> toJson() => {
    "email": List<dynamic>.from(email.map((x) => x)),
  };
}
