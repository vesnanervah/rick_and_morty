import 'package:flutter/material.dart';
import 'package:rick_and_morty/characters/entity/character_status.dart';
import 'package:rick_and_morty/characters/view/character_status_indicator.dart';

class CharactersListItemHeader extends StatelessWidget {
  final String name;
  final CharacterStatus status;
  final String? species;

  const CharactersListItemHeader({
    required this.name,
    required this.status,
    this.species,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(name, style: Theme.of(context).textTheme.titleMedium),
      Row(
        children: [
          CharacterStatusIndicator(status),
          const SizedBox(width: 4),
          Text(status.name),
          if (species != null) Text('- $species'),
        ],
      ),
    ],
  );
}
