import 'package:json_annotation/json_annotation.dart';

part 'review_api_entity.g.dart';

@JsonSerializable()
class ReviewApiEntity {
  @JsonKey(name: 'rewiew-id')
  final int id;

  @JsonKey(name: 'user-id')
  final int userId;

  @JsonKey(name: 'rating')
  final double rating;

  @JsonKey(name: 'rewiew-text')
  final String text;

  @JsonKey(name: 'rewiew-time')
  final String reviewTime;

  @JsonKey(name: 'place-id')
  final int placeId;

  @JsonKey(name: 'guide-id')
  final int guideId;

  ReviewApiEntity(
      {required this.id,
      required this.userId,
      required this.rating,
      required this.text,
      required this.reviewTime,
      required this.placeId,
      required this.guideId});

  factory ReviewApiEntity.fromJson(Map<String, dynamic> json) => _$ReviewApiEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewApiEntityToJson(this);
}
