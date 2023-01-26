import 'package:json_annotation/json_annotation.dart';

part 'register_request_body.g.dart';

@JsonSerializable()
class RegisterRequestBody {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'role-id')
  final int roleId;

  @JsonKey(name: 'mail')
  final String mail;

  @JsonKey(name: 'password')
  final String password;

  @JsonKey(name: 'sex')
  final bool sex;

  RegisterRequestBody(
      {required this.name, required this.roleId, required this.mail, required this.password, required this.sex});

  factory RegisterRequestBody.fromJson(Map<String, dynamic> json) => _$RegisterRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}
