// To parse this JSON data, do
//
//     final logoutResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LogoutResponse logoutResponseFromJson(String str) => LogoutResponse.fromJson(json.decode(str));

String logoutResponseToJson(LogoutResponse data) => json.encode(data.toJson());

class LogoutResponse {
  int id;
  String name;
  String email;
  String token;
  dynamic photo;

  LogoutResponse({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    this.photo,
  });

  factory LogoutResponse.fromJson(Map<String, dynamic> json) => LogoutResponse(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    token: json["token"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "token": token,
    "photo": photo,
  };
}
