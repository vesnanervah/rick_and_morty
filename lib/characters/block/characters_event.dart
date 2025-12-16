import 'package:rick_and_morty/characters/entity/character.dart';

sealed class CharactersEvent {
  const CharactersEvent();
}

final class NeededNextCharacters extends CharactersEvent {}

final class AddToFavoriteCharacters extends CharactersEvent {
  final Character character;

  const AddToFavoriteCharacters(this.character);
}
