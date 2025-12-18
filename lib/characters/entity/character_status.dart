import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_status.g.dart';

@HiveType(typeId: 1)
enum CharacterStatus {
  @JsonValue("Alive")
  @HiveField(0)
  alive,
  @HiveField(1)
  @JsonValue("Dead")
  dead,
  @HiveField(2)
  unknown,
}

extension Name on CharacterStatus {
  String get name => switch (this) {
    CharacterStatus.alive => "Alive",
    CharacterStatus.dead => "Dead",
    CharacterStatus.unknown => "Unknown",
  };
}
