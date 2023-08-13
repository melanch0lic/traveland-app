import 'package:json_annotation/json_annotation.dart';

import 'step_entity.dart';

part 'leg_entity.g.dart';

@JsonSerializable()
class LegEntity {
  @JsonKey(name: 'distance')
  final double distance;

  @JsonKey(name: 'duration')
  final double duration;

  @JsonKey(name: 'steps')
  final List<StepEntity> steps;

  LegEntity({
    required this.distance,
    required this.duration,
    required this.steps,
  });

  factory LegEntity.fromJson(Map<String, dynamic> json) => _$LegEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LegEntityToJson(this);
}
