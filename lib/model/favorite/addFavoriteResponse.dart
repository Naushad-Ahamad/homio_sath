// To parse this JSON data, do
//
//     final addFavoriteResponse = addFavoriteResponseFromJson(jsonString);

import 'dart:convert';

AddFavoriteResponse addFavoriteResponseFromJson(String str) => AddFavoriteResponse.fromJson(json.decode(str));

String addFavoriteResponseToJson(AddFavoriteResponse data) => json.encode(data.toJson());

class AddFavoriteResponse {
  bool success;
  String message;

  AddFavoriteResponse({
    required this.success,
    required this.message,
  });

  factory AddFavoriteResponse.fromJson(Map<String, dynamic> json) => AddFavoriteResponse(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
