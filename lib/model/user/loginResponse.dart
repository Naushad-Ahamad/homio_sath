// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  Data data;
  int statusCode;
  String message;
  bool isSuccess;
 // dynamic links;
  bool success;

  LoginResponse({
    required this.data,
    required this.statusCode,
    required this.message,
    required this.isSuccess,
  //  this.links,
    required this.success,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    data: Data.fromJson(json["data"]),
    statusCode: json["statusCode"],
    message: json["message"],
    isSuccess: json["isSuccess"],
   // links: json["links"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "statusCode": statusCode,
    "message": message,
    "isSuccess": isSuccess,
   // "links": links,
    "success": success,
  };
}

class Data {
  int userId;
  String firstName;
  String email;
  String gender;
 // dynamic profilePicture;
  int roleId;
  String token;
//  dynamic photo;

  Data({
    required this.userId,
    required this.firstName,
    required this.email,
    required this.gender,
   // this.profilePicture,
    required this.roleId,
    required this.token,
  //  this.photo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["userId"],
    firstName: json["firstName"],
    email: json["email"],
    gender: json["gender"],
  //  profilePicture: json["profilePicture"],
    roleId: json["roleId"],
    token: json["token"],
   // photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "firstName": firstName,
    "email": email,
    "gender": gender,
   // "profilePicture": profilePicture,
    "roleId": roleId,
    "token": token,
  //  "photo": photo,
  };
}
