import 'package:flutter/material.dart';

class EditDeleteAccButton extends StatelessWidget {
  const EditDeleteAccButton({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: const Color.fromRGBO(255, 47, 47, 0.5),
          side: const BorderSide(color: Color.fromRGBO(255, 47, 47, 1)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
        ),
        onPressed: () {},
        child: Center(
          child: Text(
            'Удалить аккаунт',
            style: theme.textTheme.bodyLarge!
                .copyWith(color: const Color.fromRGBO(255, 47, 47, 1), fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
