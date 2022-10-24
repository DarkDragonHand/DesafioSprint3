import 'package:flutter/material.dart';
import 'package:my_anilist/screens/my_anime_list_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyAnimeList',
      theme: ThemeData(
        primarySwatch: Colors.blue,
         //Anilist Cores
         //0xFF242538 Preto
        //237,241,245,0 Cor Cinza
      ),
      home: const MyAnimeListHomePage(),
    );
  }
}
