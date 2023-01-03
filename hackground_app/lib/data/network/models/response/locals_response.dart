import 'package:json_annotation/json_annotation.dart';

import '../../api_error.dart';
import '../../reflector.dart';
import '../entity/locals_list_entity.dart';

part 'locals_response.g.dart';

@ApiModel()
@JsonSerializable()
class LocalsResponse {
  @JsonKey(name: 'result')
  LocalsListEntity result;
  ApiError error;

  LocalsResponse({required this.result, required this.error});

  factory LocalsResponse.fromJson(Map<String, dynamic> json) => _$LocalsResponseFromJson(json);
}
