import 'package:json_annotation/json_annotation.dart';

import 'geometry_entity.dart';
import 'maneuver_entity.dart';

part 'step_entity.g.dart';

@JsonSerializable()
class StepEntity {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'distance')
  final double distance;

  @JsonKey(name: 'duration')
  final double duration;

  @JsonKey(name: 'maneuver')
  final ManeuverEntity maneuver;

  @JsonKey(name: 'geometry')
  final GeometryEntity geometry;

  StepEntity(
      {required this.name,
      required this.distance,
      required this.duration,
      required this.maneuver,
      required this.geometry});

  factory StepEntity.fromJson(Map<String, dynamic> json) => _$StepEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StepEntityToJson(this);
}
