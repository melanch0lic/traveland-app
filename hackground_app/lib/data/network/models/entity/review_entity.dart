import 'package:json_annotation/json_annotation.dart';

import 'avatars_entity.dart';

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

  ReviewEntity(
      {required this.avatars, required this.name, required this.rating, required this.reviewDate, required this.text});

  factory ReviewEntity.fromJson(Map<String, dynamic> json) => _$ReviewEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewEntityToJson(this);
}
