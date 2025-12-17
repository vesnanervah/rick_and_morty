import 'package:flutter/material.dart';
import 'package:rick_and_morty/characters/view/characters_list.dart';
import 'package:rick_and_morty/characters/view/remote_characters_list_item.dart';

class RemoteCharactersList extends CharactersList {
  const RemoteCharactersList({
    required super.characters,
    required super.onReachedEnd,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => RemoteCharactersListState();
}

class RemoteCharactersListState extends CharactersListState {
  @override
  Widget buildListItem(index) =>
      RemoteCharactersListItem(character: widget.characters[index]);
}
