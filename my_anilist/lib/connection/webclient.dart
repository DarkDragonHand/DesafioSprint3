import 'package:graphql/client.dart';

const String token = "mtLg0uDqyTThcHXijx4RM1G7lVcltPKyappq0RKu";
var id = 15125;

final _httpLink = HttpLink(
  'https://graphql.anilist.co',
);

final _authLink = AuthLink(
  getToken: () async => 'Bearer $token',
);

Link _link = _authLink.concat(_httpLink);

/// subscriptions must be split otherwise `HttpLink` will. swallow them
/*if(websocketEndpoint != null){
  final _wsLink = WebSocketLink(websockeEndpoint);
  _link = Link.split((request) => request.isSubscription, _wsLink, _link);
}*/

final GraphQLClient client = GraphQLClient(
  /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
  cache: GraphQLCache(),
  link: _link,
);
