import 'package:json_annotation/json_annotation.dart';

part 'float_entity.g.dart';

@JsonSerializable()
class FloatEntity {
  @JsonKey(name: 'Float64')
  final double value;

  @JsonKey(name: 'Valid')
  final bool isValid;

  FloatEntity({required this.value, required this.isValid});

  factory FloatEntity.fromJson(Map<String, dynamic> json) => _$FloatEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FloatEntityToJson(this);
}
