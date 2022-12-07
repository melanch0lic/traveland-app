import 'package:json_annotation/json_annotation.dart';

part 'tour_shedule_entity.g.dart';

@JsonSerializable()
class TourSheduleEntity {
  @JsonKey(name: 'text')
  final String? text;

  TourSheduleEntity({required this.text});

  factory TourSheduleEntity.fromJson(Map<String, dynamic> json) => _$TourSheduleEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TourSheduleEntityToJson(this);
}
