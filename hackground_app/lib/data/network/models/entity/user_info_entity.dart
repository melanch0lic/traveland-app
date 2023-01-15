import 'package:json_annotation/json_annotation.dart';

part 'user_info_entity.g.dart';

@JsonSerializable()
class UserInfoEntity {
  @JsonKey(name: 'user-id')
  final int userId;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'last-name')
  final String lastName;

  @JsonKey(name: 'number')
  final String number;

  @JsonKey(name: 'sex')
  final bool sex;

  @JsonKey(name: 'mail')
  final String mail;

  @JsonKey(name: 'role-id')
  final int roleId;

  UserInfoEntity(
      {required this.lastName,
      required this.mail,
      required this.name,
      required this.number,
      required this.roleId,
      required this.sex,
      required this.userId});

  factory UserInfoEntity.fromJson(Map<String, dynamic> json) => _$UserInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoEntityToJson(this);
}
