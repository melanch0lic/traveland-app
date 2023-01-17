import 'package:json_annotation/json_annotation.dart';

part 'tripster_photo_entity.g.dart';

@JsonSerializable()
class TripsterPhotoEntity {
  @JsonKey(name: 'thumbnail')
  final String smallAvatarUrl;

  @JsonKey(name: 'medium')
  final String mediumAvatarUrl;

  TripsterPhotoEntity({required this.smallAvatarUrl, required this.mediumAvatarUrl});

  factory TripsterPhotoEntity.fromJson(Map<String, dynamic> json) => _$TripsterPhotoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TripsterPhotoEntityToJson(this);
}
