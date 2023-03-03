import 'package:json_annotation/json_annotation.dart';

import 'place_info_entity.dart';
import 'string_entity.dart';

part 'housing_entity.g.dart';

@JsonSerializable()
class HousingEntity {
  @JsonKey(name: 'house-price')
  final StringEntity price;

  @JsonKey(name: 'house-type')
  final int houseType;

  @JsonKey(name: 'place-info')
  final PlaceInfoEntity placeInfo;

  HousingEntity({
    required this.price,
    required this.houseType,
    required this.placeInfo,
  });

  factory HousingEntity.fromJson(Map<String, dynamic> json) => _$HousingEntityFromJson(json);

  Map<String, dynamic> toJson() => _$HousingEntityToJson(this);
}
