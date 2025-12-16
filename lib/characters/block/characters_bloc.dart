import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/characters/block/characters_event.dart';
import 'package:rick_and_morty/characters/block/characters_state.dart';
import 'package:rick_and_morty/characters/repository/character_repo.dart';

abstract class CharactersBloc<
  S extends CharactersState,
  R extends CharacterRepo
>
    extends Bloc<CharactersEvent, S> {
  final R repo;

  CharactersBloc(super.initialState, {required this.repo});
}
