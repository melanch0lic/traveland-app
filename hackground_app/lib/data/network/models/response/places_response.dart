import 'package:json_annotation/json_annotation.dart';

import '../../api_error.dart';
import '../../reflector.dart';
import '../entity/places_list_entity.dart';

part 'places_response.g.dart';

@ApiModel()
@JsonSerializable()
class PlacesResponse {
  @JsonKey(name: 'result')
  PlacesListEntity result;
  ApiError error;

  PlacesResponse({required this.result, required this.error});

  factory PlacesResponse.fromJson(Map<String, dynamic> json) => _$PlacesResponseFromJson(json);
}
