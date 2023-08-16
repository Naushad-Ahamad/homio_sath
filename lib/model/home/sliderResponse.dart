/**
 * Created by Vikash Kumar Bharti on 11-05-2023.
 * Designation : Flutter & Android Developer
 * Company Name : 18 Pixels India Pvt. Ltd
 * Email Id : vikash.18pixels@gmail.com
 */
// To parse this JSON data, do
//
//     final sliderResponse = sliderResponseFromJson(jsonString);

import 'dart:convert';

SliderResponse sliderResponseFromJson(String str) => SliderResponse.fromJson(json.decode(str));

String sliderResponseToJson(SliderResponse data) => json.encode(data.toJson());

class SliderResponse {
  List<SlidetData> data;
  bool success;

  SliderResponse({
    required this.data,
    required this.success,
  });

  factory SliderResponse.fromJson(Map<String, dynamic> json) => SliderResponse(
    data: List<SlidetData>.from(json["data"].map((x) => SlidetData.fromJson(x))),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
  };
}

class SlidetData {
  int id;
  String imageUrl;

  SlidetData({
    required this.id,
    required this.imageUrl,
  });

  factory SlidetData.fromJson(Map<String, dynamic> json) => SlidetData(
    id: json["id"],
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image_url": imageUrl,
  };
}
