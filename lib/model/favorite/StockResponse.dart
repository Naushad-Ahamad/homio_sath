// To parse this JSON data, do
//
//     final stockResponse = stockResponseFromJson(jsonString);

import 'dart:convert';

StockResponse stockResponseFromJson(String str) => StockResponse.fromJson(json.decode(str));

String stockResponseToJson(StockResponse data) => json.encode(data.toJson());

class StockResponse {
  List<Datum> data;
  Links links;
  bool success;

  StockResponse({
    required this.data,
    required this.links,
    required this.success,
  });

  factory StockResponse.fromJson(Map<String, dynamic> json) => StockResponse(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    links: Links.fromJson(json["links"]),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "links": links.toJson(),
    "success": success,
  };
}

class Datum {
  int stockId;
  int doctorId;
  int categoryId;
  String medicineName;
  DateTime expirydate;
  int price;
  int quantity;
  int availaveQutatity;
  int sellingQutatity;
  DateTime createdOn;
  bool isActive;

  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    stockId: json["stockId"],
    doctorId: json["doctorId"],
    categoryId: json["categoryId"],
    medicineName: json["medicineName"],
    expirydate: DateTime.parse(json["expirydate"]),
    price: json["price"],
    quantity: json["quantity"],
    availaveQutatity: json["availaveQutatity"],
    sellingQutatity: json["sellingQutatity"],
    createdOn: DateTime.parse(json["createdOn"]),
    isActive: json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "stockId": stockId,
    "doctorId": doctorId,
    "categoryId": categoryId,
    "medicineName": medicineName,
    "expirydate": expirydate.toIso8601String(),
    "price": price,
    "quantity": quantity,
    "availaveQutatity": availaveQutatity,
    "sellingQutatity": sellingQutatity,
    "createdOn": createdOn.toIso8601String(),
    "isActive": isActive,
  };
}

class Links {
  int currentPage;
  int totalPage;
  int totalCount;
  bool hasNext;
  bool hasPrevious;

  Links({
    required this.currentPage,
    required this.totalPage,
    required this.totalCount,
    required this.hasNext,
    required this.hasPrevious,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    currentPage: json["currentPage"],
    totalPage: json["totalPage"],
    totalCount: json["totalCount"],
    hasNext: json["hasNext"],
    hasPrevious: json["hasPrevious"],
  );

  Map<String, dynamic> toJson() => {
    "currentPage": currentPage,
    "totalPage": totalPage,
    "totalCount": totalCount,
    "hasNext": hasNext,
    "hasPrevious": hasPrevious,
  };
}
