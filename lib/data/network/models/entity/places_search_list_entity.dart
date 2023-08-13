import 'package:json_annotation/json_annotation.dart';

import 'search_places_entity.dart';

part 'places_search_list_entity.g.dart';

@JsonSerializable()
class PlacesSearchListEntity {
  @JsonKey(name: 'places')
  final SearchPlacesEntity places;

  PlacesSearchListEntity({required this.places});

  factory PlacesSearchListEntity.fromJson(Map<String, dynamic> json) => _$PlacesSearchListEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PlacesSearchListEntityToJson(this);
}
