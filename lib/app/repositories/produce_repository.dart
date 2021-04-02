import 'package:coconut_island_app/app/data_providers/api_client.dart';
import 'package:coconut_island_app/app/models/Produce.dart';

class ProduceRepository {
  final ApiClient _apiClient;

  ProduceRepository(this._apiClient);

  Future<List<Produce>> listProduces({int month}) async {
    final produces = await _apiClient.fetchProduces(month: month);
    return produces;
  }

  Future<Produce> fetchProduce(int id) async {
    final produce = await _apiClient.fetchProduce(id);
    return produce;
  }
}
