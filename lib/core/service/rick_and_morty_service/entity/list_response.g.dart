// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListResponse _$ListResponseFromJson(Map<String, dynamic> json) => ListResponse(
  ListResponseInfo.fromJson(json['info'] as Map<String, dynamic>),
  (json['results'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$ListResponseToJson(ListResponse instance) =>
    <String, dynamic>{'info': instance.info, 'results': instance.results};
