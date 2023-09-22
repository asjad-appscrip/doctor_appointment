// To parse this JSON data, do
//
//     final packageResponse = packageResponseFromJson(jsonString);

import 'dart:convert';

PackageResponse packageResponseFromJson(String str) =>
    PackageResponse.fromJson(json.decode(str));

String packageResponseToJson(PackageResponse data) =>
    json.encode(data.toJson());

class PackageResponse {
  List<String> duration;
  List<String> package;

  PackageResponse({
    required this.duration,
    required this.package,
  });

  factory PackageResponse.fromJson(Map<String, dynamic> json) =>
      PackageResponse(
        duration: List<String>.from(json["duration"].map((x) => x)),
        package: List<String>.from(json["package"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "duration": List<dynamic>.from(duration.map((x) => x)),
        "package": List<dynamic>.from(package.map((x) => x)),
      };
}
