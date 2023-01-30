import 'package:json_annotation/json_annotation.dart';

import 'place_info_entity.dart';
import 'string_entity.dart';

part 'event_entity.g.dart';

@JsonSerializable()
class EventsEntity {
  @JsonKey(name: 'price')
  final StringEntity price;

  @JsonKey(name: 'pushkin')
  final bool isPushkin;

  @JsonKey(name: 'place-info')
  final PlaceInfoEntity placeInfo;

  EventsEntity(
      {required this.price, required this.isPushkin, required this.placeInfo});

  factory EventsEntity.fromJson(Map<String, dynamic> json) =>
      _$EventsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EventsEntityToJson(this);
}
