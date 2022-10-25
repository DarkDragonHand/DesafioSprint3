import 'package:graphql_flutter/graphql_flutter.dart';

void fetchData() async {
  final HttpLink httpLink = HttpLink('https://graphql.anilist.co');
  final GraphQLClient graphqlclient =
      GraphQLClient(link: httpLink, cache: GraphQLCache(store: HiveStore()));

  QueryResult queryResult =
      await graphqlclient.query(QueryOptions(document: gql("""query {
  AnimeSearch: Page {
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
  }""")));

  //queryResult.data
  //queryResult.exception
  //queryResult.hasException
  //queryResult.context.entry<HttpLinkResponseContext>()?.statusCode;
  
}
