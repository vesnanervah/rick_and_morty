import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/characters/block/characters_bloc.dart';
import 'package:rick_and_morty/characters/block/characters_event.dart';
import 'package:rick_and_morty/characters/block/characters_state.dart';
import 'package:rick_and_morty/characters/repository/favorite_character_repo.dart';

@Injectable()
final class FavoriteCharactersBloc
    extends CharactersBloc<CharactersState, FavoriteCharacterRepo> {
  FavoriteCharactersBloc({required super.repo}) : super(CharactersState()) {
    on<NeededNextCharacters>(onNeededNextCharacters);
    on<ToggleFavoriteCharacters>(onToggleFavoriteCharacters);
    add(NeededNextCharacters());
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

  Future<void> onToggleFavoriteCharacters(
    ToggleFavoriteCharacters event,
    Emitter<CharactersState> emit,
  ) async {
    final hasCharacter = state.characters.contains(event.character);
    if (hasCharacter) {
      try {
        final mutatedList = state.characters
            .where((c) => c != event.character)
            .toList();
        repo.deleteCharacter(event.character);
        emit(state.copyWith(characters: mutatedList));
      } catch (_) {}
    } else {
      final mutatedList = [...state.characters, event.character];
      try {
        repo.putCharacter(event.character);
        emit(state.copyWith(characters: mutatedList));
      } catch (_) {}
    }
  }
}
