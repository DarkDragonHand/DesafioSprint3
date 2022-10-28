import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_anilist/components/anime_item.dart';
import 'package:my_anilist/controller/anime_Search.dart';

class MyAnimeListHomePage extends StatefulWidget {
  const MyAnimeListHomePage({super.key});

  @override
  State<MyAnimeListHomePage> createState() => _MyAnimeListHomePageState();
}

class _MyAnimeListHomePageState extends State<MyAnimeListHomePage> {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = Text(
    "MyAnimeList",
    style: GoogleFonts.nunito(
      color: Colors.white,
      fontSize: 20,
    ),
  );
  TextEditingController searchController = TextEditingController();
  String animeQuery = """
query {
  Page {
    media(search: "Dragon ball", type: ANIME) {
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
                  //customIcon = const Icon(Icons.cancel);
                  customSearchBar = TextField(
                    controller: searchController,
                    textInputAction: TextInputAction.go,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Anime",
                        hintStyle: TextStyle(color: Colors.grey)),
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
                final image = animes[index]["coverImage"]["large"] ?? "";
                final englishTitle = animes[index]["title"]["english"] ?? "";
                final nativeTitle = animes[index]["title"]["native"] ?? "";
                final description = animes[index]["description"] ?? "";
                return AnimeItem(image, englishTitle, nativeTitle, description);
              });
        },
      ),
    );
  }
}

