import 'package:flutter/material.dart';

class Anime extends ChangeNotifier {
  int? id;
  String? nativeTitle;
  String? englishTitle;
  String? image;
  String? description;

  Anime(this.id, this.nativeTitle, this.englishTitle, this.image,
      this.description);

  Anime.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nativeTitle = json[''];
    englishTitle = json[''];
    image = json[''];
    description = json[''];
  }
}
