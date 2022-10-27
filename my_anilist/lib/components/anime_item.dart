import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimeItem extends StatelessWidget {
  final String image;
  final String englishTitle;
  final String nativeTitle;
  final String description;

  const AnimeItem(this.image, this.englishTitle, this.nativeTitle, this.description, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        tileColor: Colors.white10,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black26,
              ),
              //width: 0,
              //height: 0,
              child: Center(
                child: Image.network(image, fit: BoxFit.cover, width: 80,)),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                children: [
                  Text(
                    englishTitle.isEmpty ? "Não possui" : englishTitle,
                    style: GoogleFonts.nunito(color: Colors.black),
                  ),
                  Text(
                    nativeTitle.isEmpty ? "Não possui" : nativeTitle,
                    style: GoogleFonts.nunito(color: Colors.black),
                  ),
                ],
              ),
            ),
            //AnimeItem(),
          ],
        ),
      ),
    );
  }
}