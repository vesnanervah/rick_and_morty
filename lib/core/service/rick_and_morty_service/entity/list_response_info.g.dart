// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_response_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListResponseInfo _$ListResponseInfoFromJson(Map<String, dynamic> json) =>
    ListResponseInfo(
      (json['pages'] as num).toInt(),
      (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$ListResponseInfoToJson(ListResponseInfo instance) =>
    <String, dynamic>{'pages': instance.pages, 'count': instance.count};
