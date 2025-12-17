import 'package:flutter/material.dart';
import 'package:rick_and_morty/characters/entity/character_status.dart';

class CharacterStatusIndicator extends StatelessWidget {
  final CharacterStatus status;

  const CharacterStatusIndicator(this.status, {super.key});

  @override
  Widget build(BuildContext context) => Container(
    height: 12,
    width: 12,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: getColorFromStatus(),
    ),
  );

  Color getColorFromStatus() => switch (status) {
    CharacterStatus.alive => Colors.green,
    CharacterStatus.dead => Colors.deepOrange,
    CharacterStatus.unknown => Colors.grey,
  };
}
