// To parse this JSON data, do
//
//     final mongoDbModel = mongoDbModelFromJson(jsonString);

import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel mongoDbModelFromJson(String str) =>
    MongoDbModel.fromJson(json.decode(str));

String mongoDbModelToJson(MongoDbModel data) => json.encode(data.toJson());

class MongoDbModel {
  MongoDbModel(
      {required this.id,
      required this.personalid,
      required this.fname,
      required this.lname,
      required this.imageurl,
      required this.location,
      required this.description,
      required this.v,
      required this.assignedStatus});

  ObjectId id;
  String personalid;
  String fname;
  String lname;
  String imageurl;
  String location;
  String description;
  int v;
  bool assignedStatus;

  factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
        id: json["_id"],
        personalid: json["personalid"],
        fname: json["fname"],
        lname: json["lname"],
        imageurl: json["imageurl"],
        location: json["location"],
        description: json["description"],
        v: json["__v"],
        assignedStatus: json["assignedStatus"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id.toJson(),
        "personalid": personalid,
        "fname": fname,
        "lname": lname,
        "imageurl": imageurl,
        "location": location,
        "description": description,
        "__v": v,
        "assigedStatus": assignedStatus
      };
}

class Id {
  Id({
    required this.oid,
  });

  String oid;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024oid": oid,
      };
}
