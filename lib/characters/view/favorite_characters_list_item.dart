import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/characters/block/characters_event.dart';
import 'package:rick_and_morty/characters/block/favorite_characters_bloc.dart';
import 'package:rick_and_morty/characters/view/characters_list_item.dart';
import 'package:rick_and_morty/characters/view/toggle_favorites_characters_button.dart';

class FavoriteCharactersListItem extends CharactersListItem {
  const FavoriteCharactersListItem({required super.character, super.key});

  @override
  Widget buildToggleFavoriteButton(BuildContext context) =>
      ToggleFavoritesCharactersButton(
        isFavorite: true,
        onTap: () => context.read<FavoriteCharactersBloc>().add(
          ToggleFavoriteCharacters(character),
        ),
      );
}
