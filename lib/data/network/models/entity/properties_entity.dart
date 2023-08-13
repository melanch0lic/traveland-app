import 'package:json_annotation/json_annotation.dart';

import 'summary_entity.dart';

part 'properties_entity.g.dart';

@JsonSerializable()
class PropertiesEntity {
  @JsonKey(name: 'summary')
  final SummaryEntity summary;

  PropertiesEntity({required this.summary});

  factory PropertiesEntity.fromJson(Map<String, dynamic> json) => _$PropertiesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PropertiesEntityToJson(this);
}
