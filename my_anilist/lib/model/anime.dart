import 'package:flutter/material.dart';

class Anime extends ChangeNotifier {
  final int id;
  final String nativeTitle;
  final String englishTitle;
  final String image;
  final String description;

  Anime(this.id, this.nativeTitle, this.englishTitle, this.image, this.description);
}
