import 'package:flutter/material.dart';

import '../../../data/network/models/entity/user_info_entity.dart';

class EditEmailTextField extends StatelessWidget {
  const EditEmailTextField({
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
        Text('E-mail', style: theme.textTheme.bodyMedium),
        const SizedBox(height: 10),
        TextField(
          style: theme.textTheme.bodyMedium,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 16,
              minHeight: 14,
            ),
            hintText: userInfo.mail,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ],
    );
  }
}
