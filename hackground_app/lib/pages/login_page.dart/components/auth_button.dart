import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_page_model.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<LoginPageViewModel>();
    final authButtonState =
        context.select((LoginPageViewModel model) => model.authButtonState);

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
          backgroundColor: const Color.fromRGBO(37, 65, 178, 1),
          foregroundColor: const Color.fromRGBO(30, 53, 144, 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
        ),
        child: Center(
            child: authButtonState == ButtonState.authProcess
                ? const CircularProgressIndicator()
                : Text(
                    'Войти',
                    style: Theme.of(context).textTheme.bodyText1,
                  )),
      ),
    );
  }
}
