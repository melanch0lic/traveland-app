import 'package:json_annotation/json_annotation.dart';

import '../../reflector.dart';

part 'register_response.g.dart';

@ApiModel()
@JsonSerializable()
class RegisterResponse {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'message')
  String? message;
  // ApiError error;

  RegisterResponse({required this.id, required this.message});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => _$RegisterResponseFromJson(json);
}
