import 'package:json_annotation/json_annotation.dart';

import 'review_api_entity.dart';

part 'reviews_api_entity.g.dart';

@JsonSerializable()
class ReviewsApiEntity {
  @JsonKey(name: 'reviews')
  final List<ReviewApiEntity> reviews;

  ReviewsApiEntity({required this.reviews});

  factory ReviewsApiEntity.fromJson(Map<String, dynamic> json) => _$ReviewsApiEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsApiEntityToJson(this);
}
