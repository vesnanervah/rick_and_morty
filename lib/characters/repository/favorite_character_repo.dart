import 'dart:convert';

import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/characters/entity/character.dart';
import 'package:rick_and_morty/characters/entity/fetch_characters_result.dart';
import 'package:rick_and_morty/characters/repository/character_repo.dart';

@Injectable()
final class FavoriteCharacterRepo extends CharacterRepo {
  final _boxKey = "favorites";
  final _valueKey = "list";

  @override
  Future<FetchCharactersResult> fetchCharacters() async {
    final box = await Hive.openBox(_boxKey);
    try {
      final localVal = box.get(_valueKey) ?? "";
      if (localVal is! String) {
        throw FormatException("Invalid data in local storage");
      }
      if (localVal.isEmpty) {
        return FetchCharactersResult(pages: 0);
      }
      final jsonList = jsonDecode(localVal) as List<Map<String, dynamic>>;
      return FetchCharactersResult(
        pages: 0,
        characters: jsonList.map(Character.fromJson).toList(),
      );
    } catch (_) {
      box.delete(_valueKey);
      return FetchCharactersResult(pages: 0);
    }
  }

  // TODO(Zverev): more optimized way of putting values in local storage

  Future<void> putCharacters(List<Character> characters) async {
    final box = await Hive.openBox(_boxKey);
    final minifiedCharacters = characters.map((elem) => elem.toJson()).toList();
    box.put(_valueKey, jsonEncode(minifiedCharacters));
  }
}
