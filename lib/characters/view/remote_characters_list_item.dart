import 'package:flutter/material.dart';
import 'package:rick_and_morty/characters/view/bloc_wraped_toggle_favorites_button.dart';
import 'package:rick_and_morty/characters/view/characters_list_item.dart';

class RemoteCharactersListItem extends CharactersListItem {
  final void Function(bool)? onFavoriteChangeCb;
  const RemoteCharactersListItem({
    required super.character,
    this.onFavoriteChangeCb,
    super.key,
  });

  @override
  Widget buildToggleFavoriteButton(BuildContext context) =>
      BlocWrapedToggleFavoritesButton(
        character: character,
        onFavoriteChangeCb: onFavoriteChangeCb,
      );
}
