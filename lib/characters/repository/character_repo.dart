import 'package:rick_and_morty/characters/entity/character.dart';

abstract class CharacterRepo {
  const CharacterRepo();

  Future<Iterable<Character>> fetchCharacters();
}
