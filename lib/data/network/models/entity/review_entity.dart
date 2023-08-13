import 'package:json_annotation/json_annotation.dart';

import 'avatars_entity.dart';
import 'photo_entity.dart';

part 'review_entity.g.dart';

@JsonSerializable()
class ReviewEntity {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'avatar')
  final AvatarsEntity avatars;

  @JsonKey(name: 'created_on')
  final String reviewDate;

  @JsonKey(name: 'rating')
  final double rating;

  @JsonKey(name: 'text')
  final String text;

  @JsonKey(name: 'photos')
  final List<PhotoEntity>? photos;

  ReviewEntity(
      {required this.avatars,
      required this.name,
      required this.rating,
      required this.reviewDate,
      required this.text,
      required this.photos});

  factory ReviewEntity.fromJson(Map<String, dynamic> json) => _$ReviewEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewEntityToJson(this);
}
