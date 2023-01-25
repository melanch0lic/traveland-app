import 'package:json_annotation/json_annotation.dart';

import '../../api_error.dart';
import '../../reflector.dart';
import '../entity/housing_list_entity.dart';

part 'housing_response.g.dart';

@ApiModel()
@JsonSerializable()
class HousingResponse {
  @JsonKey(name: 'result')
  HousingListEntity result;
  ApiError error;

  HousingResponse({required this.result, required this.error});

  factory HousingResponse.fromJson(Map<String, dynamic> json) => _$HousingResponseFromJson(json);
}
