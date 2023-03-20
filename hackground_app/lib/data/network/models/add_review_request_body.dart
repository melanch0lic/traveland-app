import 'package:json_annotation/json_annotation.dart';

part 'add_review_request_body.g.dart';

@JsonSerializable()
class AddReviewRequestBody {
  @JsonKey(name: 'rating')
  final int rating;

  @JsonKey(name: 'review-text')
  final String reviewText;

  @JsonKey(name: 'place-id')
  final int placeId;

  AddReviewRequestBody({required this.rating, required this.reviewText, required this.placeId});

  factory AddReviewRequestBody.fromJson(Map<String, dynamic> json) => _$AddReviewRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AddReviewRequestBodyToJson(this);
}
