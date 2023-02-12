import 'package:flutter/material.dart';

class UseFilterButton extends StatelessWidget {
  const UseFilterButton({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: SizedBox(
        height: 48,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(37, 65, 178, 1),
            foregroundColor: const Color.fromRGBO(37, 65, 178, 0.2),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 0,
          ),
          onPressed: () {},
          child: Center(
            child: Text(
              'Применить',
              style: theme.textTheme.bodyText1!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
