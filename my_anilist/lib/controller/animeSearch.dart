import 'package:flutter/material.dart';

String createQuery(String animeName) {
  return """
query {
  Page {
    media(search: "$animeName", type: ANIME) {
      id
      coverImage {
        large
      }
      description
      title {
        english
        native
        }  
      }
    }
  }""";
}
