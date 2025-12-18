// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CharacterAdapter extends TypeAdapter<Character> {
  @override
  final typeId = 0;

  @override
  Character read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Character(
      id: (fields[0] as num).toInt(),
      name: fields[1] as String?,
      species: fields[2] as String?,
      status: fields[3] == null
          ? CharacterStatus.unknown
          : fields[3] as CharacterStatus,
      origin: fields[4] as CharacterLocation?,
      location: fields[5] as CharacterLocation?,
      image: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Character obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.species)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.origin)
      ..writeByte(5)
      ..write(obj.location)
      ..writeByte(6)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
