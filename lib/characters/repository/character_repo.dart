import 'package:rick_and_morty/characters/entity/fetch_characters_result.dart';

abstract class CharacterRepo {
  const CharacterRepo();

  Future<FetchCharactersResult> fetchCharacters();
}
