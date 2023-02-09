import 'package:json_annotation/json_annotation.dart';

import 'geometry_entity.dart';

part 'route_entity.g.dart';

@JsonSerializable()
class RouteEntity {
  @JsonKey(name: 'geometry')
  final GeometryEntity geometry;

  RouteEntity({
    required this.geometry,
  });

  factory RouteEntity.fromJson(Map<String, dynamic> json) => _$RouteEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RouteEntityToJson(this);
}
