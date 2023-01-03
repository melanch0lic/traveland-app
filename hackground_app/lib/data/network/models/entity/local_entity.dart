import 'package:json_annotation/json_annotation.dart';

import 'place_info_entity.dart';
import 'string_entity.dart';

part 'local_entity.g.dart';

@JsonSerializable()
class LocalEntity {
  @JsonKey(name: 'min-price')
  final StringEntity minPrice;

  @JsonKey(name: 'pushkin')
  final bool isPushkin;

  @JsonKey(name: 'place-info')
  final PlaceInfoEntity placeInfo;

  LocalEntity({required this.minPrice, required this.isPushkin, required this.placeInfo});

  factory LocalEntity.fromJson(Map<String, dynamic> json) => _$LocalEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LocalEntityToJson(this);
}
