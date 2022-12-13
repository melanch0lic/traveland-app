import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: () {},
        // onPressed: authButtonState == ButtonState.canSubmit ? onPressed : null,
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
