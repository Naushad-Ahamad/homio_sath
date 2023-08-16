// To parse this JSON data, do
//
//     final detailResponse = detailResponseFromJson(jsonString);

import 'dart:convert';

DetailResponse detailResponseFromJson(String str) => DetailResponse.fromJson(json.decode(str));

String detailResponseToJson(DetailResponse data) => json.encode(data.toJson());

class DetailResponse {
  Data data;
  bool success;

  DetailResponse({
    required this.data,
    required this.success,
  });

  factory DetailResponse.fromJson(Map<String, dynamic> json) => DetailResponse(
    data: Data.fromJson(json["data"]),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "success": success,
  };
}

class Data {
  int id;
  int categoryId;
  int subCategoryId;
  String title;
  double googleRating;
  List<String> images;
  String latitude;
  String longitude;
  String type;
  OperatingHours operatingHours;
  String phone;
  String website;
  String description;
  List<String> media;
  String fbProfile;
  String instaProfile;
  String youtubeProfile;
  String twitterProfile;
  int status;

  Data({
    required this.id,
    required this.categoryId,
    required this.subCategoryId,
    required this.title,
    required this.googleRating,
    required this.images,
    required this.latitude,
    required this.longitude,
    required this.type,
    required this.operatingHours,
    required this.phone,
    required this.website,
    required this.description,
    required this.media,
    required this.fbProfile,
    required this.instaProfile,
    required this.youtubeProfile,
    required this.twitterProfile,
    required this.status,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    categoryId: json["category_id"],
    subCategoryId: json["sub_category_id"],
    title: json["title"],
    googleRating: json["google_rating"]?.toDouble(),
    images: List<String>.from(json["images"].map((x) => x)),
    latitude: json["latitude"],
    longitude: json["longitude"],
    type: json["type"],
    operatingHours: OperatingHours.fromJson(json["operating_hours"]),
    phone: json["phone"],
    website: json["website"],
    description: json["description"],
    media: List<String>.from(json["media"].map((x) => x)),
    fbProfile: json["fb_profile"],
    instaProfile: json["insta_profile"],
    youtubeProfile: json["youtube_profile"],
    twitterProfile: json["twitter_profile"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "sub_category_id": subCategoryId,
    "title": title,
    "google_rating": googleRating,
    "images": List<dynamic>.from(images.map((x) => x)),
    "latitude": latitude,
    "longitude": longitude,
    "type": type,
    "operating_hours": operatingHours.toJson(),
    "phone": phone,
    "website": website,
    "description": description,
    "media": List<dynamic>.from(media.map((x) => x)),
    "fb_profile": fbProfile,
    "insta_profile": instaProfile,
    "youtube_profile": youtubeProfile,
    "twitter_profile": twitterProfile,
    "status": status,
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
