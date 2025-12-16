import 'package:rick_and_morty/characters/block/characters_state.dart';
import 'package:rick_and_morty/characters/entity/character.dart';

final class RemoteCharactersState extends CharactersState {
  final int page;

  const RemoteCharactersState({
    super.characters,
    super.hasMore,
    super.isFetchingMore,
    this.page = 0,
  });

  @override
  List<Object?> get props => [...super.props, page];

  @override
  RemoteCharactersState copyWith({
    List<Character>? characters,
    bool? hasMore,
    int? page,
    bool? isFetchingMore,
  }) => RemoteCharactersState(
    characters: characters ?? this.characters,
    hasMore: hasMore ?? this.hasMore,
    page: page ?? this.page,
    isFetchingMore: isFetchingMore ?? this.isFetchingMore,
  );
}
