import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/characters/entity/character.dart';
import 'package:rick_and_morty/characters/entity/fetch_characters_result.dart';
import 'package:rick_and_morty/characters/repository/character_repo.dart';
import 'package:rick_and_morty/core/service/rick_and_morty_service/rick_and_morty_service.dart';

@Injectable()
final class RemoteCharacterRepo extends CharacterRepo {
  final RickAndMortyService apiService;

  const RemoteCharacterRepo(this.apiService);

  @override
  Future<FetchCharactersResult> fetchCharacters({int page = 1}) async {
    final res = await apiService.getCharacters(page);
    return FetchCharactersResult(
      pages: res.info.pages,
      characters: res.results.map(Character.fromJson).toList(),
    );
  }
}
