import 'package:json_annotation/json_annotation.dart';

import 'geometry_entity.dart';
import 'properties_entity.dart';

part 'route_entity.g.dart';

@JsonSerializable()
class RouteEntity {
  @JsonKey(name: 'geometry')
  final GeometryEntity geometry;

  @JsonKey(name: 'properties')
  final PropertiesEntity properties;

  RouteEntity({required this.geometry, required this.properties});

  factory RouteEntity.fromJson(Map<String, dynamic> json) => _$RouteEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RouteEntityToJson(this);
}
