import 'package:json_annotation/json_annotation.dart';

import 'event_entity.dart';

part 'events_list_entity.g.dart';

@JsonSerializable()
class EventsListEntity {
  @JsonKey(name: 'places')
  final List<EventsEntity> places;

  EventsListEntity({required this.places});

  factory EventsListEntity.fromJson(Map<String, dynamic> json) => _$EventsListEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EventsListEntityToJson(this);
}
