import 'package:rick_and_morty/characters/entity/character.dart';

final class FetchCharactersResult {
  final int pages;
  final List<Character> characters;

  const FetchCharactersResult({
    required this.pages,
    this.characters = const [],
  });
}
