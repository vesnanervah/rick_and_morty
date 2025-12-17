import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/characters/block/characters_bloc.dart';
import 'package:rick_and_morty/characters/block/characters_event.dart';
import 'package:rick_and_morty/characters/block/remote_characters_state.dart';
import 'package:rick_and_morty/characters/repository/remote_character_repo.dart';

@Injectable()
final class RemoteCharactersBloc
    extends CharactersBloc<RemoteCharactersState, RemoteCharacterRepo> {
  RemoteCharactersBloc({required super.repo}) : super(RemoteCharactersState()) {
    on<NeededNextCharacters>(onNeededNextCharacters);
  }

  Future<void> onNeededNextCharacters(
    NeededNextCharacters event,
    Emitter<RemoteCharactersState> emit,
  ) async {
    emit(state.copyWith(isFetchingMore: true));
    try {
      final nextPage = state.page + 1;
      final res = await repo.fetchCharacters(page: nextPage);
      emit(
        state.copyWith(
          characters: [...state.characters, ...res.characters],
          page: nextPage,
          hasMore: nextPage >= state.page,
          isFetchingMore: false,
        ),
      );
    } catch (_) {
      emit(state.copyWith(hasMore: false, isFetchingMore: false));
    }
  }
}
