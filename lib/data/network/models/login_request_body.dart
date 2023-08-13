import 'package:json_annotation/json_annotation.dart';

part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequestBody {
  @JsonKey(name: 'mail')
  final String mail;

  @JsonKey(name: 'password')
  final String password;

  LoginRequestBody({required this.mail, required this.password});

  factory LoginRequestBody.fromJson(Map<String, dynamic> json) => _$LoginRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}
