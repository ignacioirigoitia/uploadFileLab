

import 'dart:convert';

class GenerateUrlResponse {
  GenerateUrlResponse({
    required this.fileUrl,
    required this.uploadUrl,
  });

  String fileUrl;
  String uploadUrl;

  factory GenerateUrlResponse.fromJson(String str) => GenerateUrlResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GenerateUrlResponse.fromMap(Map<String, dynamic> json) => GenerateUrlResponse(
    fileUrl: json["fileUrl"],
    uploadUrl: json["uploadUrl"],
  );

  Map<String, dynamic> toMap() => {
    "fileUrl": fileUrl,
    "uploadUrl": uploadUrl,
  };
}

// To parse this JSON data, do
//
//     final tempUrlResponse = tempUrlResponseFromMap(jsonString);


class TempUrlResponse {
    TempUrlResponse({
        required this.tempUrl,
    });

    String tempUrl;

    factory TempUrlResponse.fromJson(String str) => TempUrlResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TempUrlResponse.fromMap(Map<String, dynamic> json) => TempUrlResponse(
        tempUrl: json["tempUrl"],
    );

    Map<String, dynamic> toMap() => {
        "tempUrl": tempUrl,
    };
}

