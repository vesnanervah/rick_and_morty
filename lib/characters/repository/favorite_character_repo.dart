import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/characters/entity/character.dart';
import 'package:rick_and_morty/characters/entity/fetch_characters_result.dart';
import 'package:rick_and_morty/characters/repository/character_repo.dart';

@Injectable()
final class FavoriteCharacterRepo extends CharacterRepo {
  final _boxKey = "favorites";

  @override
  Future<FetchCharactersResult> fetchCharacters() async {
    final box = await Hive.openBox<Character>(_boxKey);
    try {
      final values = box.values.toList();
      return FetchCharactersResult(pages: 0, characters: values);
    } catch (e) {
      await box.clear();
      return FetchCharactersResult(pages: 0);
    }
  }

  Future<void> putCharacter(Character characters) async {
    final box = await Hive.openBox<Character>(_boxKey);
    await box.add(characters);
  }
}
