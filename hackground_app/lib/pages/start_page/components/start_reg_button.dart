import 'package:flutter/material.dart';

class StartRegistrationButton extends StatelessWidget {
  const StartRegistrationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: () {},
        // onPressed: authButtonState == ButtonState.canSubmit ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(37, 65, 178, 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
        ),
        child: const Center(child: Text('Зарегистрироваться')),
      ),
    );
  }
}
