import 'package:json_annotation/json_annotation.dart';

part 'summary_entity.g.dart';

@JsonSerializable()
class SummaryEntity {
  @JsonKey(name: 'distance')
  final double distance;

  @JsonKey(name: 'duration')
  final double duration;

  SummaryEntity({required this.distance, required this.duration});

  factory SummaryEntity.fromJson(Map<String, dynamic> json) => _$SummaryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryEntityToJson(this);
}
