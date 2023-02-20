import 'package:json_annotation/json_annotation.dart';

part 'geometry_entity.g.dart';

@JsonSerializable()
class GeometryEntity {
  @JsonKey(name: 'coordinates')
  final List<List<double>> coordinates;

  GeometryEntity({
    required this.coordinates,
  });

  factory GeometryEntity.fromJson(Map<String, dynamic> json) => _$GeometryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GeometryEntityToJson(this);
}
