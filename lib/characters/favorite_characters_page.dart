import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/characters/block/characters_event.dart';
import 'package:rick_and_morty/characters/block/characters_state.dart';
import 'package:rick_and_morty/characters/block/favorite_characters_bloc.dart';

import 'package:rick_and_morty/characters/view/favorite_characters_list.dart';

class FavoriteCharactersPage extends StatelessWidget {
  const FavoriteCharactersPage({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<FavoriteCharactersBloc, CharactersState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) => FavoriteCharactersList(
          characters: state.characters,
          onReachedEnd: () => onReachedEnd(state, context),
        ),
      );

  void onReachedEnd(CharactersState state, BuildContext context) {
    if (!state.isFetchingMore && state.hasMore) {
      context.read<FavoriteCharactersBloc>().add(NeededNextCharacters());
    }
  }
}
