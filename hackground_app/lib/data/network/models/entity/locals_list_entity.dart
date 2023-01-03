import 'package:json_annotation/json_annotation.dart';

import 'local_entity.dart';

part 'locals_list_entity.g.dart';

@JsonSerializable()
class LocalsListEntity {
  @JsonKey(name: 'locals')
  final List<LocalEntity> locals;

  LocalsListEntity({required this.locals});

  factory LocalsListEntity.fromJson(Map<String, dynamic> json) => _$LocalsListEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LocalsListEntityToJson(this);
}
