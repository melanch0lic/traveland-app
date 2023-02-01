import 'package:json_annotation/json_annotation.dart';

part 'maneuver_entity.g.dart';

@JsonSerializable()
class ManeuverEntity {
  @JsonKey(name: 'location')
  final List<double> coordinates;

  @JsonKey(name: 'type')
  final String type;

  ManeuverEntity({
    required this.coordinates,
    required this.type,
  });

  factory ManeuverEntity.fromJson(Map<String, dynamic> json) => _$ManeuverEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ManeuverEntityToJson(this);
}
