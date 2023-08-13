import 'package:json_annotation/json_annotation.dart';

import 'event_entity.dart';
import 'housing_entity.dart';
import 'place_entity.dart';

part 'search_places_entity.g.dart';

@JsonSerializable()
class SearchPlacesEntity {
  @JsonKey(name: 'house')
  final List<HousingEntity> housings;

  @JsonKey(name: 'event')
  final List<EventsEntity> events;

  @JsonKey(name: 'location')
  final List<PlaceEntity> locations;

  SearchPlacesEntity({required this.housings, required this.events, required this.locations});

  factory SearchPlacesEntity.fromJson(Map<String, dynamic> json) => _$SearchPlacesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SearchPlacesEntityToJson(this);
}
