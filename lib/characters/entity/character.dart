import 'package:equatable/equatable.dart';
import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/characters/entity/character_location.dart';
import 'package:rick_and_morty/characters/entity/character_status.dart';

part 'character.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
final class Character extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? species;
  @JsonKey(
    unknownEnumValue: CharacterStatus.unknown,
    defaultValue: CharacterStatus.unknown,
  )
  @HiveField(3)
  final CharacterStatus status;
  @HiveField(4)
  final CharacterLocation? origin;
  @HiveField(5)
  final CharacterLocation? location;
  @HiveField(6)
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
