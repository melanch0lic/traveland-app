import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../about_info_page_model.dart';

class SurnameTextField extends StatelessWidget {
  const SurnameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSurnameCorrect = context
        .select((AboutInfoPageViewModel model) => model.isSurnameCorrect);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Фамилия',
          style: theme.textTheme.bodyText2,
        ),
        const SizedBox(height: 10),
        TextField(
          style: theme.textTheme.bodyText2,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 16,
              minHeight: 14,
            ),
            hintText: 'Иванов',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: isSurnameCorrect
                      ? theme.textTheme.bodyText2!.color!
                      : const Color.fromRGBO(255, 47, 47, 1),
                  width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: isSurnameCorrect
                      ? theme.indicatorColor
                      : const Color.fromRGBO(255, 47, 47, 1),
                  width: 2),
            ),
          ),
          onChanged: (value) =>
              context.read<AboutInfoPageViewModel>().onSurnameChange(value),
          textInputAction: TextInputAction.done,
        )
      ],
    );
  }
}
