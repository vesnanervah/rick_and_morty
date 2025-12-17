import 'package:flutter/material.dart';
import 'package:rick_and_morty/characters/view/characters_list.dart';
import 'package:rick_and_morty/characters/view/favorite_characters_list_item.dart';

class FavoriteCharactersList extends CharactersList {
  const FavoriteCharactersList({
    required super.characters,
    required super.onReachedEnd,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => FavoriteCharactersListState();
}

class FavoriteCharactersListState extends CharactersListState {
  @override
  Widget buildListItem(index) =>
      FavoriteCharactersListItem(character: widget.characters[index]);
}
