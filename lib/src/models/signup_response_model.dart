// To parse this JSON data, do
//
//     final signupResponseModel = signupResponseModelFromJson(jsonString);

import 'dart:convert';

SignupResponseModel signupResponseModelFromJson(String str) =>
    SignupResponseModel.fromJson(jsonDecode(str));

String signupResponseModelToJson(SignupResponseModel data) =>
    jsonEncode(data.toJson());

class SignupResponseModel {
  String? message;
  User? user;

  SignupResponseModel({
    this.message,
    this.user,
  });


  SignupResponseModel.fromJson(Map<String, dynamic> json) {
    message =json["message"];
    user: User.fromJson(json["user"]);
  }

  Map<String, dynamic> toJson()  {
  return {
  "message": message,
  "user": user?.toJson(),
  };
}
}

class User {


  bool? isAdmin;
  String? id;
  String? name;
  String? email;
  String? password;
  int? phone;
  String? city;
  DateTime? registrationDate;
  int? v;

  User({
    this.isAdmin,
    this.id,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.city,
    this.registrationDate,
    this.v,
  });

   User.fromJson(Map<String, dynamic> json) {
        isAdmin= json["isAdmin"];
        id= json["_id"];
        name=json["name"];
        email= json["email"];
        password= json["password"];
        phone=json["phone"];
        city= json["city"];
        registrationDate= DateTime.parse(json["registrationDate"]);
        v=json["__v"];
      }


  Map<String, dynamic> toJson() => {
        "isAdmin": isAdmin,
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
        "city": city,
        "registrationDate": registrationDate?.toIso8601String(),
        "__v": v,
      };
}
