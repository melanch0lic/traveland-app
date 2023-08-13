import 'package:json_annotation/json_annotation.dart';

import 'avatars_entity.dart';

part 'guide_entity.g.dart';

@JsonSerializable()
class GuideEntity {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'first_name')
  final String name;

  @JsonKey(name: 'url')
  final String url;

  @JsonKey(name: 'avatar')
  final AvatarsEntity avatarImages;

  @JsonKey(name: 'rating')
  final double rating;

  @JsonKey(name: 'review_count')
  final int reviewCount;

  @JsonKey(name: 'guide_type')
  final String type;

  @JsonKey(name: 'description')
  final String description;

  GuideEntity({
    required this.id,
    required this.name,
    required this.url,
    required this.avatarImages,
    required this.description,
    required this.rating,
    required this.reviewCount,
    required this.type,
  });

  factory GuideEntity.fromJson(Map<String, dynamic> json) => _$GuideEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GuideEntityToJson(this);
}
