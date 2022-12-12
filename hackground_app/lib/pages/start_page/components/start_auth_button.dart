import 'package:flutter/material.dart';

class StartAuthButton extends StatelessWidget {
  const StartAuthButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: const BorderSide(color: Color.fromRGBO(37, 65, 178, 1)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
        ),
        onPressed: () {},
        child: const Center(
          child: Text(
            'Войти',
            style: TextStyle(color: Color.fromRGBO(37, 65, 178, 1)),
          ),
        ),
      ),
    );
  }
}
