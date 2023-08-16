/**
 * Created by Vikash Kumar Bharti on 25-05-2023.
 * Designation : Flutter & Android Developer
 * Company Name : 18 Pixels India Pvt. Ltd
 * Email Id : vikash.18pixels@gmail.com
 */
// To parse this JSON data, do
//
//     final searchResponse = searchResponseFromJson(jsonString);

// To parse this JSON data, do
//
//     final searchResponse = searchResponseFromJson(jsonString);

import 'dart:convert';

SearchResponse searchResponseFromJson(String str) => SearchResponse.fromJson(json.decode(str));

String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());

class SearchResponse {
  List<Datum> data;
  bool fromSerp;
  bool success;

  SearchResponse({
    required this.data,
    required this.fromSerp,
    required this.success,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    fromSerp: json["from_serp"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "from_serp": fromSerp,
    "success": success,
  };
}

class Datum {
  String title;
  double rating;
  dynamic thumbnailImg;
  String latitude;
  String longitude;
  String type;
  int status;
  String openHours;
  OperatingHours operatingHours;
  String phone;
  String address;
  String website;

  Datum({
    required this.title,
    required this.rating,
    this.thumbnailImg,
    required this.latitude,
    required this.longitude,
    required this.type,
    required this.status,
    required this.openHours,
    required this.operatingHours,
    required this.phone,
    required this.address,
    required this.website,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    title: json["title"],
    rating: json["rating"]?.toDouble(),
    thumbnailImg: json["thumbnail_img"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    type: json["type"],
    status: json["status"],
    openHours: json["open_hours"],
    operatingHours: OperatingHours.fromJson(json["operating_hours"]),
    phone: json["phone"],
    address: json["address"],
    website: json["website"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "rating": rating,
    "thumbnail_img": thumbnailImg,
    "latitude": latitude,
    "longitude": longitude,
    "type": type,
    "status": status,
    "open_hours": openHours,
    "operating_hours": operatingHours.toJson(),
    "phone": phone,
    "address": address,
    "website": website,
  };
}

class OperatingHours {
  String friday;
  String monday;
  String sunday;
  String tuesday;
  String saturday;
  String thursday;
  String wednesday;

  OperatingHours({
    required this.friday,
    required this.monday,
    required this.sunday,
    required this.tuesday,
    required this.saturday,
    required this.thursday,
    required this.wednesday,
  });

  factory OperatingHours.fromJson(Map<String, dynamic> json) => OperatingHours(
    friday: json["friday"],
    monday: json["monday"],
    sunday: json["sunday"],
    tuesday: json["tuesday"],
    saturday: json["saturday"],
    thursday: json["thursday"],
    wednesday: json["wednesday"],
  );

  Map<String, dynamic> toJson() => {
    "friday": friday,
    "monday": monday,
    "sunday": sunday,
    "tuesday": tuesday,
    "saturday": saturday,
    "thursday": thursday,
    "wednesday": wednesday,
  };
}
