import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../about_info_page_model.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isNameCorrect = context.select((AboutInfoPageViewModel model) => model.isNameCorrect);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Имя',
          style: theme.textTheme.bodyText2,
        ),
        const SizedBox(height: 10),
        TextField(
          style: theme.textTheme.bodyText2,
          decoration: InputDecoration(
            prefixIconConstraints: const BoxConstraints(
              minWidth: 16,
              minHeight: 14,
            ),
            hintText: 'Иван',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: isNameCorrect ? theme.textTheme.bodyText2!.color! : const Color.fromRGBO(255, 47, 47, 1),
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
