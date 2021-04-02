import 'package:coconut_island_app/app/models/Produce.dart';
import 'package:graphql/client.dart';

class ApiClient {
  GraphQLClient _client;

  ApiClient() {
    final _httpLink = HttpLink(
      'https://coconut-island.herokuapp.com/graphql',
    );
    this._client = new GraphQLClient(cache: GraphQLCache(), link: _httpLink);
  }

  Future<List<Produce>> fetchProduces({int month}) async {
    const String listProduces = r'''
    query ($month: Float) {
      produces (month: $month) {
        id
        name
      }
    }
    ''';

    final variables = Map<String, dynamic>();
    if (month != null) {
      variables['month'] = month;
    }

    final QueryOptions options = QueryOptions(
      document: gql(listProduces),
      variables: variables,
    );
    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      print(result.exception.toString());
    }

    final produces = (result.data['produces'] as List<dynamic>)
        .map((e) => Produce.fromJson(e))
        .toList();
    return produces;
  }

  Future<Produce> fetchProduce(int id) async {
    const String getProduce = r'''
    query ($id: Float!) {
      produce (id: $id) {
        id
        name
        seasonality {
          months
          isAllYear
        }
      }
    }
    ''';

    final variables = Map<String, dynamic>();
    variables['id'] = id;

    final QueryOptions options = QueryOptions(
      document: gql(getProduce),
      variables: variables,
    );
    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      print(result.exception.toString());
    }

    final produce = Produce.fromJson(result.data['produce'] as dynamic);
    return produce;
  }
}
