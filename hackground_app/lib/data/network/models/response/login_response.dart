import 'package:json_annotation/json_annotation.dart';

import '../../api_error.dart';
import '../../reflector.dart';
import '../entity/token_entity.dart';

part 'login_response.g.dart';

@ApiModel()
@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'result')
  TokenEntity result;
  ApiError error;

  LoginResponse({required this.result, required this.error});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}
