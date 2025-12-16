import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_location.g.dart';

@JsonSerializable()
final class CharacterLocation extends Equatable {
  final String name;

  const CharacterLocation({required this.name});

  @override
  List<Object?> get props => [name];

  factory CharacterLocation.fromJson(Map<String, dynamic> json) =>
      _$CharacterLocationFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterLocationToJson(this);
}
