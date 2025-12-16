import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/core/service/rick_and_morty_service/entity/list_response_info.dart';

part 'list_response.g.dart';

@JsonSerializable()
final class ListResponse {
  final ListResponseInfo info;
  final List<Map<String, dynamic>> results;

  const ListResponse(this.info, this.results);

  factory ListResponse.fromJson(Map<String, dynamic> json) =>
      _$ListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListResponseToJson(this);
}
