import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/characters/block/characters_event.dart';
import 'package:rick_and_morty/characters/block/characters_state.dart';
import 'package:rick_and_morty/characters/block/favorite_characters_bloc.dart';
import 'package:rick_and_morty/characters/entity/character.dart';
import 'package:rick_and_morty/characters/view/toggle_favorites_characters_button.dart';

class BlocWrapedToggleFavoritesButton extends StatelessWidget {
  final Character character;

  const BlocWrapedToggleFavoritesButton({required this.character, super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<FavoriteCharactersBloc, CharactersState>(
        buildWhen: (previous, current) =>
            previous.characters != current.characters,
        builder: (context, state) => ToggleFavoritesCharactersButton(
          isFavorite: state.characters.contains(character),
          onTap: () => context.read<FavoriteCharactersBloc>().add(
            ToggleFavoriteCharacters(character),
          ),
        ),
      );
}
