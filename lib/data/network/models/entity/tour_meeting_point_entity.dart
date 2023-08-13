import 'package:json_annotation/json_annotation.dart';

part 'tour_meeting_point_entity.g.dart';

@JsonSerializable()
class TourMeetingPointEntity {
  @JsonKey(name: 'text')
  final String? text;

  TourMeetingPointEntity({required this.text});

  factory TourMeetingPointEntity.fromJson(Map<String, dynamic> json) => _$TourMeetingPointEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TourMeetingPointEntityToJson(this);
}
