// To parse this JSON data, do
//
//     final userRegistrationResponse = userRegistrationResponseFromJson(jsonString);

import 'dart:convert';

UserRegistrationResponse userRegistrationResponseFromJson(String str) => UserRegistrationResponse.fromJson(json.decode(str));

String userRegistrationResponseToJson(UserRegistrationResponse data) => json.encode(data.toJson());

class UserRegistrationResponse {
  bool success;
  String message;

  UserRegistrationResponse({
    required this.success,
    required this.message,
  });

  factory UserRegistrationResponse.fromJson(Map<String, dynamic> json) => UserRegistrationResponse(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
