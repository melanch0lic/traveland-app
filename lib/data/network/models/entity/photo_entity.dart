import 'package:json_annotation/json_annotation.dart';

part 'photo_entity.g.dart';

@JsonSerializable()
class PhotoEntity {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'small')
  final String smallPhotoUrl;

  @JsonKey(name: 'medium')
  final String mediumPhotoUrl;

  PhotoEntity({
    required this.id,
    required this.smallPhotoUrl,
    required this.mediumPhotoUrl,
  });

  factory PhotoEntity.fromJson(Map<String, dynamic> json) => _$PhotoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoEntityToJson(this);
}
