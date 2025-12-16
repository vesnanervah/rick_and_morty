import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/characters/entity/character_location.dart';
import 'package:rick_and_morty/characters/entity/character_status.dart';

part 'character.g.dart';

@JsonSerializable()
final class Character extends Equatable {
  final int id;
  final String? name;
  final String? species;
  @JsonKey(
    unknownEnumValue: CharacterStatus.unknown,
    defaultValue: CharacterStatus.unknown,
  )
  final CharacterStatus status;
  final CharacterLocation? origin;
  final CharacterLocation? location;
  final String? image;

  const Character({
    required this.id,
    this.name,
    this.species,
    this.status = CharacterStatus.unknown,
    this.origin,
    this.location,
    this.image,
  });

  @override
  List<Object?> get props => [id];

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}
