// To parse this JSON data, do
//
//     final topDesignInstituteResponse = topDesignInstituteResponseFromJson(jsonString);
/**
 * Created by Vikash Kumar Bharti on 27-04-2023.
 * Designation : Flutter & Android Developer
 * Company Name : 18 Pixels India Pvt. Ltd
 * Email Id : vikash.18pixels@gmail.com
 */
import 'dart:convert';

TopDesignInstituteResponse topDesignInstituteResponseFromJson(String str) => TopDesignInstituteResponse.fromJson(json.decode(str));

String topDesignInstituteResponseToJson(TopDesignInstituteResponse data) => json.encode(data.toJson());

class TopDesignInstituteResponse {
  bool success;
  List<Datum> data;

  TopDesignInstituteResponse({
    required this.success,
    required this.data,
  });

  factory TopDesignInstituteResponse.fromJson(Map<String, dynamic> json) => TopDesignInstituteResponse(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String title;
  var googleRating;
  String type;
  String phone;
  String website;
  int status;
  String thumbnailImg;

  Datum({
    required this.id,
    required this.title,
    required this.googleRating,
    required this.type,
    required this.phone,
    required this.website,
    required this.status,
    required this.thumbnailImg,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    googleRating: json["google_rating"],
    type: json["type"],
    phone: json["phone"],
    website: json["website"],
    status: json["status"],
    thumbnailImg: json["thumbnail_img"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "google_rating": googleRating,
    "type": type,
    "phone": phone,
    "website": website,
    "status": status,
    "thumbnail_img": thumbnailImg,
  };
}
