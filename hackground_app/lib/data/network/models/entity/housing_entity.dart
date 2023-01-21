import 'package:json_annotation/json_annotation.dart';

import 'float_entity.dart';
import 'int_entity.dart';
import 'place_info_entity.dart';

part 'housing_entity.g.dart';

@JsonSerializable()
class HousingEntity {
  @JsonKey(name: 'house-price')
  final String price;

  @JsonKey(name: 'count-room')
  final IntEntity roomsCount;

  @JsonKey(name: 'square')
  final FloatEntity square;

  @JsonKey(name: 'house-type')
  final int houseType;

  @JsonKey(name: 'place-info')
  final PlaceInfoEntity placeInfo;

  HousingEntity(
      {required this.price,
      required this.houseType,
      required this.placeInfo,
      required this.roomsCount,
      required this.square});

  factory HousingEntity.fromJson(Map<String, dynamic> json) => _$HousingEntityFromJson(json);

  Map<String, dynamic> toJson() => _$HousingEntityToJson(this);
}
