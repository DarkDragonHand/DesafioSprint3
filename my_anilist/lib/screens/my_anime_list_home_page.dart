import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_anilist/components/anime_item.dart';

class MyAnimeListHomePage extends StatefulWidget {
  const MyAnimeListHomePage({super.key});

  @override
  State<MyAnimeListHomePage> createState() => _MyAnimeListHomePageState();
}

class _MyAnimeListHomePageState extends State<MyAnimeListHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MyAnimeList",
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              /*showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );*/
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Container(
        color: Colors.black,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                tileColor: Colors.purple[300],
                title: Row(
                  children: const [
                    AnimeItem(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}



  /*class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var animeTitle in searchTerms) {
      if (animeTitle.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(animeTitle);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var sugestion = matchQuery[index];
        return ListTile(
          title: Text(sugestion),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var animeTitle in searchTerms) {
      if (animeTitle.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(animeTitle);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var sugestion = matchQuery[index];
        return ListTile(
          title: Text(sugestion),
        );
      },
    );
  }
}*/

