import 'package:flutter/material.dart';
import 'package:rick_and_morty/characters/entity/character.dart';

abstract class CharactersList extends StatefulWidget {
  final bool isLoading;
  final List<Character> characters;
  final VoidCallback onReachedEnd;
  const CharactersList({
    required this.characters,
    required this.onReachedEnd,
    required this.isLoading,
    super.key,
  });
}

abstract class CharactersListState extends State<CharactersList> {
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
  Widget build(BuildContext context) {
    if (widget.characters.isEmpty && !widget.isLoading) {
      return Center(child: Text("Список пуст"));
    }
    if (widget.characters.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: widget.characters.length,
      controller: listController,
      itemBuilder: (_, index) {
        return Padding(
          key: ValueKey(widget.characters[index].id),
          padding: index == 0
              ? EdgeInsets.zero
              : const EdgeInsets.only(top: 16),
          child: buildListItem(index),
        );
      },
    );
  }

  Widget buildListItem(index);
}
