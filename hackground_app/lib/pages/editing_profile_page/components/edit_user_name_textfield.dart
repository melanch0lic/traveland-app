import 'package:flutter/material.dart';

import '../../../data/network/models/entity/user_info_entity.dart';

class EditUserNameTextField extends StatelessWidget {
  const EditUserNameTextField({
    Key? key,
    required this.theme,
    required this.userInfo,
  }) : super(key: key);

  final ThemeData theme;
  final UserInfoEntity userInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Имя пользователя', style: theme.textTheme.bodyText2),
        const SizedBox(height: 10),
        TextField(
          style: theme.textTheme.bodyText2,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 16,
              minHeight: 14,
            ),
            hintText: '${userInfo.name} ${userInfo.lastName.value}',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(),
            ),
          ),
        ),
      ],
    );
  }
}
