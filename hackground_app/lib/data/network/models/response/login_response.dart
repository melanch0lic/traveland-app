import 'package:json_annotation/json_annotation.dart';

import '../../api_error.dart';
import '../../reflector.dart';

part 'login_response.g.dart';

@ApiModel()
@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'token')
  String jwtToken;
  // ApiError error;

  LoginResponse({
    required this.jwtToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}
