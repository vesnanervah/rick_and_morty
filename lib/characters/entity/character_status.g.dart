// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CharacterStatusAdapter extends TypeAdapter<CharacterStatus> {
  @override
  final typeId = 1;

  @override
  CharacterStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CharacterStatus.alive;
      case 1:
        return CharacterStatus.dead;
      case 2:
        return CharacterStatus.unknown;
      default:
        return CharacterStatus.alive;
    }
  }

  @override
  void write(BinaryWriter writer, CharacterStatus obj) {
    switch (obj) {
      case CharacterStatus.alive:
        writer.writeByte(0);
      case CharacterStatus.dead:
        writer.writeByte(1);
      case CharacterStatus.unknown:
        writer.writeByte(2);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacterStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
