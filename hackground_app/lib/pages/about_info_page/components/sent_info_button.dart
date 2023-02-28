import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app_localizations.dart';
import '../about_info_page_model.dart';

class SentInfoButton extends StatelessWidget {
  const SentInfoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authButtonState = context.select((AboutInfoPageViewModel model) => model.authButtonState);
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: authButtonState == ButtonState.canSubmit
            ? () {
                context.read<AboutInfoPageViewModel>().onSentInfoButtonPressed().then((value) {
                  if (value) {
                    context.router.replaceNamed('/tabs');
                  }
                });
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.indicatorColor,
          foregroundColor: theme.highlightColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
        ),
        child: Center(
            child: authButtonState == ButtonState.authProcess
                ? const CircularProgressIndicator()
                : Text(
                    translate(context, 'sign_up'),
                    style: theme.textTheme.bodyLarge,
                  )),
      ),
    );
  }
}
