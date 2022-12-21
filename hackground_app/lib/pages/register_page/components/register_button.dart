import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../navigation/router.gr.dart';
import '../register_page_model.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authButtonState = context.select((RegisterPageViewModel model) => model.authButtonState);
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: authButtonState == ButtonState.canSubmit
            ? () {
                context.read<RegisterPageViewModel>().onRegisterButtonPressed().then((value) {
                  if (value) {
                    context.router.push(AboutInfoRoute(
                        email: context.read<RegisterPageViewModel>().email,
                        password: context.read<RegisterPageViewModel>().password));
                  }
                });
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(37, 65, 178, 1),
          foregroundColor: const Color.fromRGBO(30, 53, 144, 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
        ),
        child: Center(
            child: Text(
          'Зарегистрироваться',
          style: Theme.of(context).textTheme.bodyText1,
        )),
      ),
    );
  }
}
