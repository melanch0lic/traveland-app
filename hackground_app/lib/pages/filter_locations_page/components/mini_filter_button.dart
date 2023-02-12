import 'package:flutter/material.dart';

class MiniFilterButton extends StatelessWidget {
  final String name;
  const MiniFilterButton({
    Key? key,
    required this.theme,
    required this.name,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 39,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: const Color.fromRGBO(37, 65, 178, 0.2),
          side:
              const BorderSide(color: Color.fromRGBO(37, 65, 178, 1), width: 2),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
        ),
        onPressed: () {},
        child: Center(
          child: Text(
            name,
            style: theme.textTheme.bodyText1!.copyWith(
                color: Color.fromRGBO(44, 44, 46, 1),
                fontWeight: FontWeight.w400,
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}
