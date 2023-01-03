import 'package:json_annotation/json_annotation.dart';

part 'int_entity.g.dart';

@JsonSerializable()
class IntEntity {
  @JsonKey(name: 'Int32')
  final double value;

  @JsonKey(name: 'Valid')
  final bool isValid;

  IntEntity({required this.value, required this.isValid});

  factory IntEntity.fromJson(Map<String, dynamic> json) => _$IntEntityFromJson(json);

  Map<String, dynamic> toJson() => _$IntEntityToJson(this);
}
