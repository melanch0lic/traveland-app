import 'package:json_annotation/json_annotation.dart';

import '../../api_error.dart';
import '../../reflector.dart';
import '../entity/users_entity.dart';

part 'user_by_id_response.g.dart';

@ApiModel()
@JsonSerializable()
class UserByIdResponse {
  @JsonKey(name: 'result')
  UsersEntity? result;

  ApiError? error;

  UserByIdResponse({required this.result, required this.error});

  factory UserByIdResponse.fromJson(Map<String, dynamic> json) => _$UserByIdResponseFromJson(json);
}
