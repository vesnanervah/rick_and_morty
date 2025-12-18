import 'package:flutter/material.dart';
import 'package:rick_and_morty/characters/view/animated_remote_characters_list_item.dart';
import 'package:rick_and_morty/characters/view/characters_list.dart';

class RemoteCharactersList extends CharactersList {
  const RemoteCharactersList({
    required super.characters,
    required super.onReachedEnd,
    required super.isLoading,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => RemoteCharactersListState();
}

class RemoteCharactersListState extends CharactersListState {
  @override
  Widget buildListItem(index) =>
      AnimatedRemoteCharactersListItem(character: widget.characters[index]);
}
