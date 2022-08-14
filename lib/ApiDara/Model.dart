// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<GModel> GModelFromJson(String str) =>
    List<GModel>.from(json.decode(str).map((x) => GModel.fromJson(x)));

class GModel {
  GModel({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
  });

  final String? id;
  final String? author;
  final int? width;
  final int? height;
  final String? url;
  final String? downloadUrl;

  factory GModel.fromJson(Map<String, dynamic> json) => GModel(
        id: json["id"],
        author: json["author"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
      );
}
