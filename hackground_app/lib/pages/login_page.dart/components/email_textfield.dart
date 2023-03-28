import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../login_page_model.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDataCorrect = context.select((LoginPageViewModel model) => model.isDataCorrect);
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'E-mail',
          style: isDataCorrect
              ? theme.textTheme.bodyMedium
              : theme.textTheme.bodyMedium!.copyWith(color: const Color.fromRGBO(255, 47, 47, 1)),
        ),
        const SizedBox(height: 10),
        TextField(
          style: theme.textTheme.bodyMedium,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 16,
              minHeight: 14,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 6),
              child: SvgPicture.asset(
                'assets/images/email_icon.svg',
                color: theme.textTheme.bodyMedium!.color,
              ),
            ),
            hintText: 'example@mail.com',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: isDataCorrect ? theme.textTheme.bodyMedium!.color! : const Color.fromRGBO(255, 47, 47, 1),
                  width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: isDataCorrect ? theme.indicatorColor : const Color.fromRGBO(255, 47, 47, 1), width: 2),
            ),
          ),
          onChanged: (value) => context.read<LoginPageViewModel>().onMailChange(value),
        )
      ],
    );
  }
}
