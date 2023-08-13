import 'package:json_annotation/json_annotation.dart';

import 'user_info_entity.dart';

part 'users_entity.g.dart';

@JsonSerializable()
class UsersEntity {
  @JsonKey(name: 'users')
  final UserInfoEntity? users;

  UsersEntity({required this.users});

  factory UsersEntity.fromJson(Map<String, dynamic> json) => _$UsersEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UsersEntityToJson(this);
}
