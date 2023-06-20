import 'dart:convert';

List<ApiCall> apiCallFromJson(String str) =>
    List<ApiCall>.from(json.decode(str).map((x) => ApiCall.fromJson(x)));

String apiCallToJson(List<ApiCall> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApiCall {
  String id;
  String memoNo;
  String firstName;
  String lastName;
  int age;
  String gender;
  String ngoAssigned;
  String description;
  String pickupLocation;
  DateTime pickupDate;
  String image;

  ApiCall({
    required this.id,
    required this.memoNo,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.gender,
    required this.ngoAssigned,
    required this.description,
    required this.pickupLocation,
    required this.pickupDate,
    required this.image,
  });

  factory ApiCall.fromJson(Map<String, dynamic> json) => ApiCall(
        id: json["id"],
        memoNo: json["memo_no"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        age: json["age"],
        gender: json["gender"],
        ngoAssigned: json["ngo_assigned"],
        description: json["description"],
        pickupLocation: json["pickup_location"],
        pickupDate: DateTime.parse(json["pickup_date"]),
        image: json["Image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "memo_no": memoNo,
        "first_name": firstName,
        "last_name": lastName,
        "age": age,
        "gender": gender,
        "ngo_assigned": ngoAssigned,
        "description": description,
        "pickup_location": pickupLocation,
        "pickup_date": pickupDate.toIso8601String(),
        "Image": image,
      };
}
