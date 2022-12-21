import 'package:json_annotation/json_annotation.dart';

import '../../api_error.dart';
import '../../reflector.dart';
import '../entity/id_entity.dart';

part 'register_response.g.dart';

@ApiModel()
@JsonSerializable()
class RegisterResponse {
  @JsonKey(name: 'result')
  IdEntity? result;

  ApiError? error;

  RegisterResponse({required this.result, required this.error});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => _$RegisterResponseFromJson(json);
}
