import 'package:json_annotation/json_annotation.dart';

import 'leg_entity.dart';

part 'route_entity.g.dart';

@JsonSerializable()
class RouteEntity {
  @JsonKey(name: 'geometry')
  final String geometry;

  @JsonKey(name: 'distance')
  final double distance;

  @JsonKey(name: 'duration')
  final double duration;

  @JsonKey(name: 'legs')
  final List<LegEntity> legs;

  RouteEntity({
    required this.geometry,
    required this.distance,
    required this.duration,
    required this.legs,
  });

  factory RouteEntity.fromJson(Map<String, dynamic> json) => _$RouteEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RouteEntityToJson(this);
}
