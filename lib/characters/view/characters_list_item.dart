import 'package:flutter/material.dart';
import 'package:rick_and_morty/characters/entity/character.dart';
import 'package:rick_and_morty/characters/view/character_list_item_information_block.dart';
import 'package:rick_and_morty/characters/view/characters_list_item_header.dart';
import 'package:rick_and_morty/core/view/safe_image.dart';

abstract class CharactersListItem extends StatelessWidget {
  final Character character;

  const CharactersListItem({required this.character, super.key});

  @override
  Widget build(BuildContext context) => Card(
    clipBehavior: Clip.hardEdge,
    child: SizedBox(
      height: 200,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 4 / 4,
            child: SafeImage(url: character.image),
          ),
          Flexible(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CharactersListItemHeader(
                        name: character.name ?? "Character",
                        status: character.status,
                        species: character.species,
                      ),
                      if (character.origin?.name != null)
                        CharacterListItemInformationBlock(
                          label: "Origin location:",
                          value: character.origin!.name,
                        ),
                      if (character.location?.name != null)
                        CharacterListItemInformationBlock(
                          label: "Last known location:",
                          value: character.location!.name,
                        ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: buildToggleFavoriteButton(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  Widget buildToggleFavoriteButton(BuildContext context);
}
