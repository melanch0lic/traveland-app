import 'package:json_annotation/json_annotation.dart';

import '../../api_error.dart';
import '../../reflector.dart';
import '../entity/token_entity.dart';

part 'login_response.g.dart';

@ApiModel()
@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'result')
  TokenEntity jwtToken;
  ApiError error;

  LoginResponse({required this.jwtToken, required this.error});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}
