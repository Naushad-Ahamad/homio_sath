/**
 * Created by Vikash Kumar Bharti on 10-05-2023.
 * Designation : Flutter & Android Developer
 * Company Name : 18 Pixels India Pvt. Ltd
 * Email Id : vikash.18pixels@gmail.com
 */
// To parse this JSON data, do
//
//     final topDanceResponse = topDanceResponseFromJson(jsonString);

import 'dart:convert';

TopDanceResponse topDanceResponseFromJson(String str) => TopDanceResponse.fromJson(json.decode(str));

String topDanceResponseToJson(TopDanceResponse data) => json.encode(data.toJson());

class TopDanceResponse {
  List<Datum> data;
  bool success;

  TopDanceResponse({
    required this.data,
    required this.success,
  });

  factory TopDanceResponse.fromJson(Map<String, dynamic> json) => TopDanceResponse(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
  };
}

class Datum {
  int id;
  String title;
  double googleRating;
  String type;
  OperatingHours operatingHours;
  String phone;
  String website;
  int status;
  String openHours;
  String location;
  String latitude;
  String longitude;
  String thumbnailImg;

  Datum({
    required this.id,
    required this.title,
    required this.googleRating,
    required this.type,
    required this.operatingHours,
    required this.phone,
    required this.website,
    required this.status,
    required this.openHours,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.thumbnailImg,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    googleRating: json["google_rating"]?.toDouble(),
    type: json["type"],
    operatingHours: OperatingHours.fromJson(json["operating_hours"]),
    phone: json["phone"],
    website: json["website"],
    status: json["status"],
    openHours: json["open_hours"],
    location: json["location"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    thumbnailImg: json["thumbnail_img"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "google_rating": googleRating,
    "type": type,
    "operating_hours": operatingHours.toJson(),
    "phone": phone,
    "website": website,
    "status": status,
    "open_hours": openHours,
    "location": location,
    "latitude": latitude,
    "longitude": longitude,
    "thumbnail_img": thumbnailImg,
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
