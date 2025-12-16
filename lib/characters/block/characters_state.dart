import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/characters/entity/character.dart';

class CharactersState extends Equatable {
  final List<Character> characters;
  final bool hasMore;
  final bool isFetchingMore;

  const CharactersState({
    this.characters = const [],
    this.hasMore = true,
    this.isFetchingMore = false,
  });

  @override
  List<Object?> get props => [characters, hasMore, isFetchingMore];

  CharactersState copyWith({
    List<Character>? characters,
    bool? hasMore,
    bool? isFetchingMore,
  }) => CharactersState(
    characters: characters ?? this.characters,
    hasMore: hasMore ?? this.hasMore,
    isFetchingMore: isFetchingMore ?? this.isFetchingMore,
  );
}
