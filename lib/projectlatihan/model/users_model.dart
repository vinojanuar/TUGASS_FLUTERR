// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UsersModel {
  final int? id;
  final String nama;
  final String email;

  UsersModel({this.id, required this.nama, required this.email});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'nama': nama, 'email': email};
  }

  factory UsersModel.fromMap(Map<String, dynamic> map) {
    return UsersModel(
      id: map['id'] != null ? map['id'] as int : null,
      nama: map['nama'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UsersModel.fromJson(String source) =>
      UsersModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
