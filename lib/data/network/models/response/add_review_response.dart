import 'package:json_annotation/json_annotation.dart';

import '../../api_error.dart';
import '../../reflector.dart';
import '../entity/id_entity.dart';

part 'add_review_response.g.dart';

@ApiModel()
@JsonSerializable()
class AddReviewResponse {
  @JsonKey(name: 'result')
  IdEntity result;
  ApiError error;

  AddReviewResponse({required this.result, required this.error});

  factory AddReviewResponse.fromJson(Map<String, dynamic> json) => _$AddReviewResponseFromJson(json);
}
