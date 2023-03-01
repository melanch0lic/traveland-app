import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app_localizations.dart';
import '../login_page_model.dart';

class AuthSettingsWidget extends StatelessWidget {
  const AuthSettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Transform.scale(
          scale: 1.1,
          child: Checkbox(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              fillColor: MaterialStateProperty.all(theme.highlightColor),
              value: context.select((LoginPageViewModel model) => model.isRememberUser),
              onChanged: (_) => context.read<LoginPageViewModel>().changeRememberUserMode()),
        ),
        GestureDetector(
          onTap: context.read<LoginPageViewModel>().changeRememberUserMode,
          child: Text(
            translate(context, 'remember_password_text'),
            style: theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w300),
          ),
        ),
        const Spacer(),
        // Text(translate(context, 'remember_password_text'), style: theme.textTheme.bodyText2)
      ],
    );
  }
}
