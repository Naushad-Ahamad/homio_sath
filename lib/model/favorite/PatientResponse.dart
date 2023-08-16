// To parse this JSON data, do
//
//     final patientResponse = patientResponseFromJson(jsonString);

import 'dart:convert';

PatientResponse patientResponseFromJson(String str) => PatientResponse.fromJson(json.decode(str));

String patientResponseToJson(PatientResponse data) => json.encode(data.toJson());

class PatientResponse {
  List<Datum> data;
  Links links;
  bool success;

  PatientResponse({
    required this.data,
    required this.links,
    required this.success,
  });

  factory PatientResponse.fromJson(Map<String, dynamic> json) => PatientResponse(
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
  int patientId;
  int doctorId;
  String firstName;
  String lastName;
  String gender;
  String email;
////  String password;
//  dynamic confirmPassword;
  String mobileNo;
  //DateTime dateofBirth;
 // String profile;
 // String address;
 // String adharNo;
  String uuid;
 // String patientProblemDescription;
  //DateTime symptomOnsetDate;
//  String allergies;
 // String currentMedications;
  //String medicalHistory;
  //String familyMedicalHistory;
  //bool isActive;
  //DateTime createdOn;
//  int createdBy;
  //DateTime updatedOn;
 // int updatedBy;

  Datum({
    required this.patientId,
    required this.doctorId,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.email,
    //required this.password,
  //  required this.confirmPassword,
    required this.mobileNo,
  //  required this.dateofBirth,
  //  required this.profile,
  //  required this.address,
   // required this.adharNo,
    required this.uuid,
    //required this.patientProblemDescription,
    //required this.symptomOnsetDate,
   // required this.allergies,
   // required this.currentMedications,
   // required this.medicalHistory,
   // required this.familyMedicalHistory,
   // required this.isActive,
   // required this.createdOn,
   // required this.createdBy,
   // required this.updatedOn,
   // required this.updatedBy,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    patientId: json["patientId"],
    doctorId: json["doctorId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    gender: json["gender"],
    email: json["email"],
   // password: json["password"],
  //  confirmPassword: json["confirmPassword"],
   mobileNo: json["mobileNo"],
    //dateofBirth: DateTime.parse(json["dateofBirth"]),
   // profile: json["profile"],
 //   address: json["address"],
   // adharNo: json["adharNo"],
    uuid: json["uuid"],
    //patientProblemDescription: json["patientProblemDescription"],
  //  symptomOnsetDate: DateTime.parse(json["symptomOnsetDate"]),
 //   allergies: json["allergies"],
  // currentMedications: json["currentMedications"],
  // medicalHistory: json["medicalHistory"],
  // familyMedicalHistory: json["familyMedicalHistory"],
  // isActive: json["isActive"],
  // createdOn: DateTime.parse(json["createdOn"]),
   // createdBy: json["createdBy"],
   // updatedOn: DateTime.parse(json["updatedOn"]),
   // updatedBy: json["updatedBy"],
  );

  Map<String, dynamic> toJson() => {
    "patientId": patientId,
    "doctorId": doctorId,
    "firstName": firstName,
    "lastName": lastName,
    "gender": gender,
    "email": email,
    //"password": password,
 //   "confirmPassword": confirmPassword,
  //  "mobileNo": mobileNo,
   // "dateofBirth": dateofBirth.toIso8601String(),
    //"profile": profile,
   // "address": address,
 //   "adharNo": adharNo,
    "uuid": uuid,
  //  "allergies": allergies,
   //"patientProblemDescription": patientProblemDescription,
   //"symptomOnsetDate": "${symptomOnsetDate.year.toString().padLeft(4, '0')}-${symptomOnsetDate.month.toString().padLeft(2, '0')}-${symptomOnsetDate.day.toString().padLeft(2, '0')}",
   //
   //"currentMedications": currentMedications,
   //"medicalHistory": medicalHistory,
   //"familyMedicalHistory": familyMedicalHistory,
   //"isActive": isActive,
   //"createdOn": createdOn.toIso8601String(),
  //  "createdBy": createdBy,
  //  "updatedOn": updatedOn.toIso8601String(),
  //  "updatedBy": updatedBy,
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
