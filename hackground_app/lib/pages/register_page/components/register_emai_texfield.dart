import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../register_page_model.dart';

class RegisterEmailTextField extends StatelessWidget {
  const RegisterEmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isEmailCorrect =
        context.select((RegisterPageViewModel model) => model.isEmailCorrect);
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'E-mail',
          style: isEmailCorrect
              ? theme.textTheme.bodyText2
              : theme.textTheme.bodyText2!
                  .copyWith(color: const Color.fromRGBO(255, 47, 47, 1)),
        ),
        const SizedBox(height: 10),
        TextField(
          style: isEmailCorrect
              ? theme.textTheme.bodyText2
              : theme.textTheme.bodyText2!
                  .copyWith(color: const Color.fromRGBO(255, 47, 47, 1)),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 16,
              minHeight: 14,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(
                  left: 16, top: 16, bottom: 16, right: 6),
              child: SvgPicture.asset(
                'assets/images/email_icon.svg',
                color: isEmailCorrect
                    ? theme.textTheme.bodyText2!.color
                    : const Color.fromRGBO(255, 47, 47, 1),
              ),
            ),
            hintText: 'example@mail.com',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: isEmailCorrect
                      ? theme.textTheme.bodyText2!.color!
                      : const Color.fromRGBO(255, 47, 47, 1),
                  width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: isEmailCorrect
                      ? theme.indicatorColor
                      : const Color.fromRGBO(255, 47, 47, 1),
                  width: 2),
            ),
          ),
          autofillHints: const [AutofillHints.email],
          textInputAction: TextInputAction.next,
          onChanged: (value) =>
              context.read<RegisterPageViewModel>().onMailChange(value),
        )
      ],
    );
  }
}
