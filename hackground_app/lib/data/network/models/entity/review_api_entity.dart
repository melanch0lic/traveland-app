import 'package:json_annotation/json_annotation.dart';

part 'review_api_entity.g.dart';

@JsonSerializable()
class ReviewApiEntity {
  @JsonKey(name: 'rewiew-id')
  final int id;

  @JsonKey(name: 'user-name')
  final String userName;

  @JsonKey(name: 'rating')
  final int rating;

  @JsonKey(name: 'review-text')
  final String text;

  @JsonKey(name: 'review-time')
  final String reviewTime;

  ReviewApiEntity(
      {required this.id, required this.userName, required this.rating, required this.text, required this.reviewTime});

  factory ReviewApiEntity.fromJson(Map<String, dynamic> json) => _$ReviewApiEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewApiEntityToJson(this);
}
