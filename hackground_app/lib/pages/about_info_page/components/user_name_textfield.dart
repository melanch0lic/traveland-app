import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../about_info_page_model.dart';

class UserNameTextField extends StatelessWidget {
  const UserNameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isNameCorrect = context.select((AboutInfoPageViewModel model) => model.isNameCorrect);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tr('username_text'), style: theme.textTheme.bodyMedium!.copyWith(color: theme.primaryColorDark)),
        const SizedBox(height: 10),
        TextField(
          style: theme.textTheme.bodyMedium!.copyWith(color: theme.primaryColorDark),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 16,
              minHeight: 14,
            ),
            hintText: tr('ivan'),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: isNameCorrect ? theme.textTheme.bodyMedium!.color! : const Color.fromRGBO(255, 47, 47, 1),
                  width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: isNameCorrect ? theme.indicatorColor : const Color.fromRGBO(255, 47, 47, 1), width: 2),
            ),
          ),
          onChanged: (value) => context.read<AboutInfoPageViewModel>().onNameChange(value),
          textInputAction: TextInputAction.next,
        )
      ],
    );
  }
}
