import 'package:json_annotation/json_annotation.dart';

import 'housing_entity.dart';

part 'housing_list_entity.g.dart';

@JsonSerializable()
class HousingListEntity {
  @JsonKey(name: 'places')
  final List<HousingEntity> places;

  HousingListEntity({required this.places});

  factory HousingListEntity.fromJson(Map<String, dynamic> json) => _$HousingListEntityFromJson(json);

  Map<String, dynamic> toJson() => _$HousingListEntityToJson(this);
}
