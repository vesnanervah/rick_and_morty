import 'package:flutter/material.dart';
import 'package:rick_and_morty/characters/entity/character.dart';
import 'package:rick_and_morty/characters/view/characters_list_item.dart';

class CharactersList extends StatefulWidget {
  final List<Character> characters;
  final VoidCallback onReachedEnd;
  const CharactersList({
    required this.characters,
    required this.onReachedEnd,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => CharactersListState();
}

class CharactersListState extends State<CharactersList> {
  final listController = ScrollController();

  @override
  void initState() {
    super.initState();
    widget.onReachedEnd();
    listController.addListener(() {
      if (listController.position.pixels >=
          listController.position.maxScrollExtent - 40) {
        widget.onReachedEnd();
      }
    });
  }

  @override
  void dispose() {
    listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ListView.builder(
    padding: const EdgeInsets.all(16),
    itemCount: widget.characters.length,
    controller: listController,
    itemBuilder: (_, index) => Padding(
      padding: index == 0 ? EdgeInsets.zero : const EdgeInsets.only(top: 16),
      child: CharactersListItem(character: widget.characters[index]),
    ),
  );
}
