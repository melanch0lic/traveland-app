import 'package:json_annotation/json_annotation.dart';

part 'string_entity.g.dart';

@JsonSerializable()
class StringEntity {
  @JsonKey(name: 'String')
  final String value;

  @JsonKey(name: 'Valid')
  final bool isValid;

  StringEntity({required this.value, required this.isValid});

  factory StringEntity.fromJson(Map<String, dynamic> json) => _$StringEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StringEntityToJson(this);
}
