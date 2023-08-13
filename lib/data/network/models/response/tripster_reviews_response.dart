import 'package:json_annotation/json_annotation.dart';

import '../../api_error.dart';
import '../../reflector.dart';
import '../entity/review_entity.dart';

part 'tripster_reviews_response.g.dart';

@ApiModel()
@JsonSerializable()
class TripsterReviewsResponse {
  @JsonKey(name: 'count')
  final int count;

  @JsonKey(name: 'next')
  final String? next;

  @JsonKey(name: 'previous')
  final String? previous;

  @JsonKey(name: 'results')
  List<ReviewEntity> results;

  ApiError? error;

  TripsterReviewsResponse(
      {required this.results, required this.error, required this.count, required this.next, required this.previous});

  factory TripsterReviewsResponse.fromJson(Map<String, dynamic> json) => _$TripsterReviewsResponseFromJson(json);
}
