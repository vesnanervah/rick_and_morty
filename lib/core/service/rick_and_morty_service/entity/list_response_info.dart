import 'package:json_annotation/json_annotation.dart';

part 'list_response_info.g.dart';

@JsonSerializable()
final class ListResponseInfo {
  final int pages;
  final int count;

  ListResponseInfo(this.pages, this.count);

  factory ListResponseInfo.fromJson(Map<String, dynamic> json) =>
      _$ListResponseInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ListResponseInfoToJson(this);
}
