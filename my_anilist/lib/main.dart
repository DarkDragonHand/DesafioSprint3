import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_anilist/screens/my_anime_list_home_page.dart';

void main() async {
  await initHiveForFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final HttpLink httpLink = HttpLink('https://graphql.anilist.co');
  final AuthLink authLink = AuthLink(getToken: () async => 'Bearer mtLg0uDqyTThcHXijx4RM1G7lVcltPKyappq0RKu',
  );
  //final Link link = authLink.concat(httpLink);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<GraphQLClient> graphqlclient = ValueNotifier(
        GraphQLClient(
            link: httpLink, cache: GraphQLCache(store: HiveStore())));
    return GraphQLProvider(
      client: graphqlclient,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyAnimeList',
        theme: ThemeData(
          primaryColor: const Color(0xFF242538),
          //primarySwatch: Colors.blue,
          //Anilist Cores
          //0xFF242538 Preto
          //237,241,245,0 Cor Cinza
        ),
        home: const MyAnimeListHomePage(),
      ),
    );
  }
}
