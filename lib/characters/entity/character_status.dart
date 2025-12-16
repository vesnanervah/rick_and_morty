import 'package:json_annotation/json_annotation.dart';

enum CharacterStatus {
  @JsonValue("Alive")
  alive,
  @JsonValue("Dead")
  dead,
  unknown,
}

extension Name on CharacterStatus {
  String get name => switch (this) {
    CharacterStatus.alive => "Alive",
    CharacterStatus.dead => "Dead",
    CharacterStatus.unknown => "Unknown",
  };
}
