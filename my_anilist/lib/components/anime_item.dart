import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimeItem extends StatelessWidget {
  const AnimeItem({super.key});

  //final Image animePhoto;
  //final String animeTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black26,
          ),
          width: 80,
          height: 100,
          child: Center(
          child: Text(
            "No Image", 
            style: GoogleFonts.nunito(
              color: Colors.black, 
              fontWeight: FontWeight.bold)),
          ),
        ),
        const SizedBox(width: 15),
        Column(
          children: [
            Text(
              "Título do anime",
              style: GoogleFonts.nunito(color: Colors.black),
            ),
            Text(
              "Descrição",
              style: GoogleFonts.nunito(color: Colors.black),
            ),
          ],
        ),
        
      ],
    );
  }
}
