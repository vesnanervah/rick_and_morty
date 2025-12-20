import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/characters/block/characters_bloc.dart';
import 'package:rick_and_morty/characters/block/characters_event.dart';
import 'package:rick_and_morty/characters/block/remote_characters_state.dart';
import 'package:rick_and_morty/characters/repository/remote_character_repo.dart';
import 'package:rick_and_morty/core/utils/event_transoftmer.dart';

@Injectable()
final class RemoteCharactersBloc
    extends CharactersBloc<RemoteCharactersState, RemoteCharacterRepo> {
  RemoteCharactersBloc({required super.repo}) : super(RemoteCharactersState()) {
    on<NeededNextCharacters>(
      onNeededNextCharacters,
      transformer: debounceTransformer(const Duration(milliseconds: 200)),
    );
  }

  Future<void> onNeededNextCharacters(
    NeededNextCharacters event,
    Emitter<RemoteCharactersState> emit,
  ) async {
    emit(state.copyWith(isFetchingMore: true));
    try {
      final page = state.page + 1;
      final res = await repo.fetchCharacters(page: page);
      emit(
        state.copyWith(
          characters: [...state.characters, ...res.characters],
          page: page,
          hasMore: res.pages > page,
          isFetchingMore: false,
        ),
      );
    } catch (_) {
      emit(state.copyWith(hasMore: false, isFetchingMore: false));
    }
  }
}
