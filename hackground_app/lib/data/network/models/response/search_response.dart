import 'package:json_annotation/json_annotation.dart';

import '../../api_error.dart';
import '../../reflector.dart';
import '../entity/places_search_list_entity.dart';

part 'search_response.g.dart';

@ApiModel()
@JsonSerializable()
class SearchResponse {
  @JsonKey(name: 'result')
  PlacesSearchListEntity result;

  ApiError error;

  SearchResponse({required this.result, required this.error});

  factory SearchResponse.fromJson(Map<String, dynamic> json) => _$SearchResponseFromJson(json);
}
