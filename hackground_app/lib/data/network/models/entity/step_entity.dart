import 'package:json_annotation/json_annotation.dart';

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

  StepEntity({
    required this.name,
    required this.distance,
    required this.duration,
    required this.maneuver,
  });

  factory StepEntity.fromJson(Map<String, dynamic> json) => _$StepEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StepEntityToJson(this);
}
