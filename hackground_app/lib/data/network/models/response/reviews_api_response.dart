import 'package:json_annotation/json_annotation.dart';

import '../../api_error.dart';
import '../../reflector.dart';
import '../entity/reviews_api_entity.dart';

part 'reviews_api_response.g.dart';

@ApiModel()
@JsonSerializable()
class ReviewsApiResponse {
  @JsonKey(name: 'result')
  ReviewsApiEntity result;

  ApiError error;

  ReviewsApiResponse({required this.result, required this.error});

  factory ReviewsApiResponse.fromJson(Map<String, dynamic> json) => _$ReviewsApiResponseFromJson(json);
}
