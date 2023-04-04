import 'package:json_annotation/json_annotation.dart';

import 'float_entity.dart';
import 'review_api_entity.dart';

part 'reviews_api_entity.g.dart';

@JsonSerializable()
class ReviewsApiEntity {
  @JsonKey(name: 'reviews')
  final List<ReviewApiEntity> reviews;

  @JsonKey(name: 'mean-rating')
  FloatEntity rating;

  ReviewsApiEntity({required this.reviews, required this.rating});

  factory ReviewsApiEntity.fromJson(Map<String, dynamic> json) => _$ReviewsApiEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsApiEntityToJson(this);
}
