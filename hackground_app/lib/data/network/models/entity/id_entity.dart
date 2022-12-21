import 'package:json_annotation/json_annotation.dart';

part 'id_entity.g.dart';

@JsonSerializable()
class IdEntity {
  @JsonKey(name: 'id')
  final int? id;

  IdEntity({required this.id});

  factory IdEntity.fromJson(Map<String, dynamic> json) => _$IdEntityFromJson(json);

  Map<String, dynamic> toJson() => _$IdEntityToJson(this);
}
