import 'package:flutter/material.dart';
import 'package:rick_and_morty/characters/entity/character.dart';

class CharactersListItem extends StatelessWidget {
  final Character character;
  final bool isFavorite;

  const CharactersListItem({
    required this.character,
    this.isFavorite = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Card(child: Column());
}
