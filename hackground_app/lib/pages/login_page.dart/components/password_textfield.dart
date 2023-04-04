import 'package:easy_localization/easy_localization.dart';
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
    final isDataCorrect = context.select((LoginPageViewModel model) => model.isDataCorrect);
    final password = context.select((LoginPageViewModel model) => model.password);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr('password_text'),
          style: isDataCorrect
              ? theme.textTheme.bodyMedium!.copyWith(color: theme.primaryColorDark)
              : theme.textTheme.bodyMedium!.copyWith(color: const Color.fromRGBO(255, 47, 47, 1)),
        ),
        const SizedBox(height: 10),
        TextField(
          obscureText: isHidePassword,
          style: !isDataCorrect
              ? theme.textTheme.bodyMedium!.copyWith(color: const Color.fromRGBO(255, 47, 47, 1))
              : password.isNotEmpty
                  ? theme.textTheme.bodyMedium!.copyWith(color: theme.primaryColorDark)
                  : theme.textTheme.bodyMedium,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15),
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
                color: !isDataCorrect
                    ? const Color.fromRGBO(255, 47, 47, 1)
                    : password.isNotEmpty
                        ? theme.primaryColorDark
                        : theme.textTheme.bodyMedium!.color,
              ),
            ),
            suffixIcon: GestureDetector(
                onTap: () {
                  context.read<LoginPageViewModel>().changeHidePasswordMode();
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16, right: 16),
                  child: SvgPicture.asset(
                    isHidePassword ? 'assets/images/show_password_icon.svg' : 'assets/images/hide_password_icon.svg',
                    width: 24,
                    height: 24,
                    color: !isDataCorrect
                        ? const Color.fromRGBO(255, 47, 47, 1)
                        : password.isNotEmpty
                            ? theme.primaryColorDark
                            : theme.textTheme.bodyMedium!.color,
                  ),
                )),
            hintText: tr('at_least_six_text'),
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
          onChanged: (value) => context.read<LoginPageViewModel>().onPasswordChange(value),
        )
      ],
    );
  }
}
