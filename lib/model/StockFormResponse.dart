// To parse this JSON data, do
//
//     final stockFormResponse = stockFormResponseFromJson(jsonString);

import 'dart:convert';

StockFormResponse stockFormResponseFromJson(String str) => StockFormResponse.fromJson(json.decode(str));

String stockFormResponseToJson(StockFormResponse data) => json.encode(data.toJson());

class StockFormResponse {
  Data data;
  int statusCode;
  String message;
  bool isSuccess;
 // dynamic links;
  bool success;

  StockFormResponse({
    required this.data,
    required this.statusCode,
    required this.message,
    required this.isSuccess,
   // this.links,
    required this.success,
  });

  factory StockFormResponse.fromJson(Map<String, dynamic> json) => StockFormResponse(
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
  //  "links": links,
    "success": success,
  };
}

class Data {
  int stockId;
  int doctorId;
  int categoryId;
  String medicineName;
  String expirydate;
  String price;
  int quantity;
  int availaveQutatity;
  int sellingQutatity;
  String createdOn;
  bool isActive;

  Data({
    required this.stockId,
    required this.doctorId,
    required this.categoryId,
    required this.medicineName,
    required this.expirydate,
    required this.price,
    required this.quantity,
    required this.availaveQutatity,
    required this.sellingQutatity,
    required this.createdOn,
    required this.isActive,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    stockId: json["stockId"],
    doctorId: json["doctorId"],
    categoryId: json["categoryId"],
    medicineName: json["medicineName"],
    expirydate: json["expirydate"],
    price: json["price"],
    quantity: json["quantity"],
    availaveQutatity: json["availaveQutatity"],
    sellingQutatity: json["sellingQutatity"],
    createdOn: json["createdOn"],
    isActive: json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "stockId": stockId,
    "doctorId": doctorId,
    "categoryId": categoryId,
    "medicineName": medicineName,
    "expirydate": expirydate,
    "price": price,
    "quantity": quantity,
    "availaveQutatity": availaveQutatity,
    "sellingQutatity": sellingQutatity,
    "createdOn": createdOn,
    "isActive": isActive,
  };
}
