import 'package:json_annotation/json_annotation.dart';

part 'guide_avatars_entity.g.dart';

@JsonSerializable()
class GuideAvatarsEntity {
  @JsonKey(name: 'small')
  final String smallAvatarUrl;

  @JsonKey(name: 'medium')
  final String mediumAvatarUrl;

  GuideAvatarsEntity({required this.smallAvatarUrl, required this.mediumAvatarUrl});

  factory GuideAvatarsEntity.fromJson(Map<String, dynamic> json) => _$GuideAvatarsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GuideAvatarsEntityToJson(this);
}
