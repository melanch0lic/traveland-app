import 'package:json_annotation/json_annotation.dart';

part 'avatars_entity.g.dart';

@JsonSerializable()
class AvatarsEntity {
  @JsonKey(name: 'small')
  final String smallAvatarUrl;

  @JsonKey(name: 'medium')
  final String mediumAvatarUrl;

  AvatarsEntity({required this.smallAvatarUrl, required this.mediumAvatarUrl});

  factory AvatarsEntity.fromJson(Map<String, dynamic> json) => _$AvatarsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AvatarsEntityToJson(this);
}
