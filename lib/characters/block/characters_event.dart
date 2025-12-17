import 'package:rick_and_morty/characters/entity/character.dart';

sealed class CharactersEvent {
  const CharactersEvent();
}

final class NeededNextCharacters extends CharactersEvent {}

final class ToggleFavoriteCharacters extends CharactersEvent {
  final Character character;

  const ToggleFavoriteCharacters(this.character);
}
