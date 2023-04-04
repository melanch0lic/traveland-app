import 'package:json_annotation/json_annotation.dart';

import 'string_entity.dart';

part 'user_info_entity.g.dart';

@JsonSerializable()
class UserInfoEntity {
  @JsonKey(name: 'user-id')
  final int userId;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'last-name')
  final StringEntity lastName;

  @JsonKey(name: 'number')
  final StringEntity number;

  @JsonKey(name: 'sex')
  final bool sex;

  @JsonKey(name: 'mail')
  final String mail;

  @JsonKey(name: 'role-id')
  final int roleId;

  @JsonKey(name: 'image')
  final StringEntity image;

  UserInfoEntity(
      {required this.lastName,
      required this.mail,
      required this.name,
      required this.number,
      required this.roleId,
      required this.sex,
      required this.userId,
      required this.image});

  factory UserInfoEntity.fromJson(Map<String, dynamic> json) => _$UserInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoEntityToJson(this);
}
