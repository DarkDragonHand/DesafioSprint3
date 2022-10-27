import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_anilist/controller/animeSearch.dart';

class MyAnimeListHomePage extends StatefulWidget {
  const MyAnimeListHomePage({super.key});

  @override
  State<MyAnimeListHomePage> createState() => _MyAnimeListHomePageState();
}

class _MyAnimeListHomePageState extends State<MyAnimeListHomePage> {
  Icon customIcon = Icon(Icons.search);
  Widget customSearchBar = Text(
    "MyAnimeList",
    style: GoogleFonts.nunito(
      color: Colors.white,
      fontSize: 20,
    ),
  );
  TextEditingController searchController = TextEditingController();
  String animeQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF242538),
        title: customSearchBar,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  customIcon == const Icon(Icons.cancel);
                  customSearchBar = TextField(
                    controller: searchController,
                    textInputAction: TextInputAction.go,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search Anime",
                    ),
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  );
                  animeQuery = createQuery(searchController.text);
                } else {
                  customIcon = const Icon(Icons.search);
                  customSearchBar = Text(
                    "MyAnimeList",
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  );
                }
              });
            },
            icon: customIcon,
          )
        ],
      ),
      body: Query(
        options: QueryOptions(document: gql(animeQuery)),
        builder: (QueryResult result, {fetchMore, refetch}) {
          if (result.hasException) {
            return Center(
              child: Text("Ocorreu algum erro na busca.",
                  style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontSize: 30,
                  )),
            );
          }
          if (result.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          List animes = result.data!["Page"]["media"];

          return ListView.builder(
              itemCount: animes.length,
              itemBuilder: (context, index) {
                final titulo = animes[index]["description"];
                return Card(
                  child: ListTile(
                    tileColor: Colors.purple[300],
                    title: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black26,
                          ),
                          width: 80,
                          height: 100,
                          child: Center(
                            child: Text(titulo,
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
                        //AnimeItem(),
                      ],
                    ),
                  ),
                );
              });
        },
        /*FutureBuilder<List<dynamic>>(
            future: fetchAnimesData(),
            builder: (context, snapshot) {
              var data = snapshot.data;
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: animes.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      tileColor: Colors.purple[300],
                      title: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black26,
                            ),
                            width: 80,
                            height: 100,
                            child: Center(
                              child: Text("No Image",
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
                          //AnimeItem(),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),*/
      ),
    );
  }
}
