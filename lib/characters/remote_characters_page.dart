import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/characters/block/characters_event.dart';
import 'package:rick_and_morty/characters/block/remote_characters_bloc.dart';
import 'package:rick_and_morty/characters/block/remote_characters_state.dart';
import 'package:rick_and_morty/characters/view/characters_list.dart';

class RemoteCharactersPage extends StatelessWidget {
  const RemoteCharactersPage({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<RemoteCharactersBloc, RemoteCharactersState>(
        builder: (context, state) => CharactersList(
          characters: state.characters,
          onReachedEnd: () => onReachedEnd(state, context),
        ),
      );

  // TODO(Zverev): handle copypast
  void onReachedEnd(RemoteCharactersState state, BuildContext context) {
    if (!state.isFetchingMore && state.hasMore) {
      context.read<RemoteCharactersBloc>().add(NeededNextCharacters());
    }
  }
}
