import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app_localizations.dart';
import '../login_page_model.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final model = context.read<LoginPageViewModel>();
    final authButtonState = context.select((LoginPageViewModel model) => model.authButtonState);

    void onPressed() {
      model.onAuthButtonPressed().then((value) {
        if (value) {
          context.router.replaceNamed('/tabs');
        }
      });
    }

    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: authButtonState == ButtonState.canSubmit ? onPressed : null,
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
                    translate(context, 'sign_in'),
                    style: Theme.of(context).textTheme.bodyLarge,
                  )),
      ),
    );
  }
}
