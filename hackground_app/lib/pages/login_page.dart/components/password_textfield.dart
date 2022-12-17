import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../login_page_model.dart';

class PasswordTextfield extends StatelessWidget {
  const PasswordTextfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isHidePassword = context.select((LoginPageViewModel model) => model.isHidePassword);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Пароль',
          style: theme.textTheme.bodyText2,
        ),
        const SizedBox(height: 10),
        TextField(
          obscureText: isHidePassword,
          style: theme.textTheme.bodyText2,
          decoration: InputDecoration(
            prefixIconConstraints: const BoxConstraints(
              minWidth: 16,
              minHeight: 14,
            ),
            suffixIconConstraints: const BoxConstraints(
              minWidth: 16,
              minHeight: 14,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 6),
              child: SvgPicture.asset(
                'assets/images/password_icon.svg',
                color: theme.textTheme.bodyText2!.color,
              ),
            ),
            suffixIcon: InkWell(
                highlightColor: theme.cardColor,
                onTap: () {
                  context.read<LoginPageViewModel>().changeHidePasswordMode();
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16, right: 16),
                  child: SvgPicture.asset(
                    'assets/images/hide_password_icon.svg',
                    color: theme.textTheme.bodyText2!.color,
                  ),
                )),
            hintText: 'Минимум 6 символов',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: theme.textTheme.bodyText2!.color!,
                  width: 2,
                )),
          ),
          onChanged: (value) => context.read<LoginPageViewModel>().onPasswordChange(value),
        )
      ],
    );
  }
}
