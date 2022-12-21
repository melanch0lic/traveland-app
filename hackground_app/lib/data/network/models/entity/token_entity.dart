import 'package:json_annotation/json_annotation.dart';

part 'token_entity.g.dart';

@JsonSerializable()
class TokenEntity {
  @JsonKey(name: 'token')
  final String token;

  TokenEntity({required this.token});

  factory TokenEntity.fromJson(Map<String, dynamic> json) => _$TokenEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TokenEntityToJson(this);
}
