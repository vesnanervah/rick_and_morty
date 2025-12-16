import 'dart:convert';

import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/service/rick_and_morty_service/entity/list_response.dart';

@Injectable()
final class RickAndMortyService {
  final Client client;

  const RickAndMortyService(this.client);

  Future<ListResponse> getCharacters(int page) async {
    final uri = _buildUri(
      relativePath: "/character",
      queryParams: {"page": page.toString()},
    );
    final resp = await client.get(uri);
    final body = jsonDecode(resp.body);
    return ListResponse.fromJson(body);
  }

  Uri _buildUri({
    required String relativePath,
    Map<String, dynamic>? queryParams,
  }) => Uri(
    scheme: "https",
    host: "rickandmortyapi.com",
    path: "/api$relativePath",
    queryParameters: queryParams,
  );
}
