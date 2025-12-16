import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/characters/block/characters_bloc.dart';
import 'package:rick_and_morty/characters/block/characters_event.dart';
import 'package:rick_and_morty/characters/block/characters_state.dart';
import 'package:rick_and_morty/characters/repository/favorite_character_repo.dart';

final class FavoriteCharactersBloc
    extends CharactersBloc<CharactersState, FavoriteCharacterRepo> {
  FavoriteCharactersBloc({required super.repo}) : super(CharactersState()) {
    on<NeededNextCharacters>(onNeededNextCharacters);
    on<AddToFavoriteCharacters>(onAddToFavoriteCharacters);
  }

  Future<void> onNeededNextCharacters(
    NeededNextCharacters event,
    Emitter<CharactersState> emit,
  ) async {
    emit(state.copyWith(isFetchingMore: true));
    try {
      final res = await repo.fetchCharacters();
      emit(
        state.copyWith(
          characters: res.characters,
          isFetchingMore: false,
          hasMore: false,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(characters: [], isFetchingMore: false, hasMore: false),
      );
    }
  }

  Future<void> onAddToFavoriteCharacters(
    AddToFavoriteCharacters event,
    Emitter<CharactersState> emit,
  ) async {
    if (state.characters.contains(event.character)) {
      // TODO(Zverev): delete operation
      return;
    }
    try {
      final mutatedList = [...state.characters, event.character];
      repo.putCharacters(mutatedList);
      emit(state.copyWith(characters: mutatedList));
    } catch (_) {
      emit(state);
    }
  }
}
