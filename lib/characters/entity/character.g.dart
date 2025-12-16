// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String?,
  species: json['species'] as String?,
  status:
      $enumDecodeNullable(
        _$CharacterStatusEnumMap,
        json['status'],
        unknownValue: CharacterStatus.unknown,
      ) ??
      CharacterStatus.unknown,
  origin: json['origin'] == null
      ? null
      : CharacterLocation.fromJson(json['origin'] as Map<String, dynamic>),
  location: json['location'] == null
      ? null
      : CharacterLocation.fromJson(json['location'] as Map<String, dynamic>),
  image: json['image'] as String?,
);

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'species': instance.species,
  'status': _$CharacterStatusEnumMap[instance.status]!,
  'origin': instance.origin,
  'location': instance.location,
  'image': instance.image,
};

const _$CharacterStatusEnumMap = {
  CharacterStatus.alive: 'Alive',
  CharacterStatus.dead: 'Dead',
  CharacterStatus.unknown: 'unknown',
};
