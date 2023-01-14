import 'package:json_annotation/json_annotation.dart';

import 'float_entity.dart';
import 'int_entity.dart';
import 'string_entity.dart';

part 'place_info_entity.g.dart';

@JsonSerializable()
class PlaceInfoEntity {
  @JsonKey(name: 'place-id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'adress')
  final String adress;

  @JsonKey(name: 'latitude')
  final FloatEntity latitude;

  @JsonKey(name: 'longitude')
  final FloatEntity longitude;

  @JsonKey(name: 'number')
  final StringEntity number;

  @JsonKey(name: 'mail')
  final StringEntity mail;

  @JsonKey(name: 'url')
  final StringEntity url;

  @JsonKey(name: 'number-of-rating')
  final IntEntity ratingCount;

  @JsonKey(name: 'mean-rating')
  final FloatEntity meanRating;

  // @JsonKey(name: 'photos')
  // final List<String> photos;

  PlaceInfoEntity(
      {required this.id,
      required this.name,
      required this.adress,
      required this.description,
      required this.latitude,
      required this.longitude,
      required this.mail,
      required this.meanRating,
      required this.number,
      // required this.photos,
      required this.ratingCount,
      required this.url});

  factory PlaceInfoEntity.fromJson(Map<String, dynamic> json) => _$PlaceInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceInfoEntityToJson(this);
}
