// To parse this JSON data, do
//
//     final userBody = userBodyFromJson(jsonString);

import 'dart:convert';

UserBody userBodyFromJson(String str) => UserBody.fromJson(json.decode(str));

String userBodyToJson(UserBody data) => json.encode(data.toJson());

class UserBody {
  String email;
  String password;

  UserBody({
    required this.email,
    required this.password,
  });

  factory UserBody.fromJson(Map<String, dynamic> json) => UserBody(
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}
