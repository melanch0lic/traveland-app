import 'package:json_annotation/json_annotation.dart';

import 'place_entity.dart';

part 'places_list_entity.g.dart';

@JsonSerializable()
class PlacesListEntity {
  @JsonKey(name: 'places')
  final List<PlaceEntity> places;

  PlacesListEntity({required this.places});

  factory PlacesListEntity.fromJson(Map<String, dynamic> json) => _$PlacesListEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PlacesListEntityToJson(this);
}
