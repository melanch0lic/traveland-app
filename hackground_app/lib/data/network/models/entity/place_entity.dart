import 'package:json_annotation/json_annotation.dart';

import 'place_info_entity.dart';
import 'shedule_item_entity.dart';
import 'string_entity.dart';

part 'place_entity.g.dart';

@JsonSerializable()
class PlaceEntity {
  @JsonKey(name: 'min-price')
  final StringEntity price;

  @JsonKey(name: 'pushkin')
  final bool isPushkin;

  @JsonKey(name: 'place-info')
  final PlaceInfoEntity placeInfo;

  @JsonKey(name: 'shedule')
  final List<SheduleItemEntity> shedule;

  @JsonKey(name: 'type-id')
  final List<int> typeIds;

  PlaceEntity(
      {required this.price,
      required this.isPushkin,
      required this.placeInfo,
      required this.shedule,
      required this.typeIds});

  factory PlaceEntity.fromJson(Map<String, dynamic> json) => _$PlaceEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceEntityToJson(this);
}
