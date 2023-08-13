import 'package:json_annotation/json_annotation.dart';

import 'string_entity.dart';

part 'shedule_item_entity.g.dart';

@JsonSerializable()
class SheduleItemEntity {
  @JsonKey(name: 'place-id')
  final int placeId;

  @JsonKey(name: 'week-day')
  final String weekDay;

  @JsonKey(name: 'start-work')
  final StringEntity startWork;

  @JsonKey(name: 'end-work')
  final StringEntity endWork;

  @JsonKey(name: 'start-timeout')
  final StringEntity startTimeout;

  @JsonKey(name: 'end-timeout')
  final StringEntity endTimeout;

  SheduleItemEntity(
      {required this.placeId,
      required this.weekDay,
      required this.startWork,
      required this.endWork,
      required this.startTimeout,
      required this.endTimeout});

  factory SheduleItemEntity.fromJson(Map<String, dynamic> json) => _$SheduleItemEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SheduleItemEntityToJson(this);
}
