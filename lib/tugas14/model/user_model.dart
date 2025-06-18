// To parse this JSON data, do
//
//     final listUserResponse = listUserResponseFromJson(jsonString);

import 'dart:convert';

ListUserResponse listUserResponseFromJson(String str) =>
    ListUserResponse.fromJson(json.decode(str));

String listUserResponseToJson(ListUserResponse data) =>
    json.encode(data.toJson());

class ListUserResponse {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Users>? data;
  Support? support;

  ListUserResponse({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  factory ListUserResponse.fromJson(Map<String, dynamic> json) =>
      ListUserResponse(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data:
            json["data"] == null
                ? []
                : List<Users>.from(json["data"]!.map((x) => Users.fromJson(x))),
        support:
            json["support"] == null ? null : Support.fromJson(json["support"]),
      );

  Map<String, dynamic> toJson() => {
    "page": page,
    "per_page": perPage,
    "total": total,
    "total_pages": totalPages,
    "data":
        data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "support": support?.toJson(),
  };
}

class Users {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Users({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    id: json["id"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "avatar": avatar,
  };
}

class Support {
  String? url;
  String? text;

  Support({this.url, this.text});

  factory Support.fromJson(Map<String, dynamic> json) =>
      Support(url: json["url"], text: json["text"]);

  Map<String, dynamic> toJson() => {"url": url, "text": text};
}
