// To parse this JSON data, do
//
//     final homeScreenResponse = homeScreenResponseFromJson(jsonString);
/**
 * Created by Vikash Kumar Bharti on 27-04-2023.
 * Designation : Flutter & Android Developer
 * Company Name : 18 Pixels India Pvt. Ltd
 * Email Id : vikash.18pixels@gmail.com
 */
import 'dart:convert';

HomeScreenResponse homeScreenResponseFromJson(String str) => HomeScreenResponse.fromJson(json.decode(str));

String homeScreenResponseToJson(HomeScreenResponse data) => json.encode(data.toJson());

class HomeScreenResponse {
  bool success;
  Data data;

  HomeScreenResponse({
    required this.success,
    required this.data,
  });

  factory HomeScreenResponse.fromJson(Map<String, dynamic> json) => HomeScreenResponse(
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
  };
}

class Data {
  List<Category> categories;
  List<City> cities;

  Data({
    required this.categories,
    required this.cities,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    cities: List<City>.from(json["cities"].map((x) => City.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
  };
}

class Category {
  int id;
  String name;
  String slug;
  String picture;
  String iconClass;
  String type;
  String pictureUrl;
  String description;
  String seoTitle;
  String seoDescription;
  String seoKeywords;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.picture,
    required this.iconClass,
    required this.type,
    required this.pictureUrl,
    required this.description,
    required this.seoTitle,
    required this.seoDescription,
    required this.seoKeywords,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    picture: json["picture"],
    iconClass: json["icon_class"],
    type: json["type"],
    pictureUrl: json["picture_url"],
    description: json["description"],
    seoTitle: json["seo_title"],
    seoDescription: json["seo_description"],
    seoKeywords: json["seo_keywords"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "picture": picture,
    "icon_class": iconClass,
    "type": type,
    "picture_url": pictureUrl,
    "description": description,
    "seo_title": seoTitle,
    "seo_description": seoDescription,
    "seo_keywords": seoKeywords,
  };
}

class City {
  int id;
  String name;
  CountryCode countryCode;
  String slug;

  City({
    required this.id,
    required this.name,
    required this.countryCode,
    required this.slug,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    name: json["name"],
    countryCode: countryCodeValues.map[json["country_code"]]!,
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country_code": countryCodeValues.reverse[countryCode],
    "slug": slug,
  };
}

enum CountryCode { AE }

final countryCodeValues = EnumValues({
  "AE": CountryCode.AE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
