import 'package:flutter/material.dart';

class SearchMapWidget extends StatelessWidget {
  const SearchMapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      style: theme.textTheme.bodyText1,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: theme.cardColor),
        suffixIcon: Icon(Icons.keyboard_voice, color: theme.cardColor),
        contentPadding: const EdgeInsets.all(15),
        hintStyle: theme.textTheme.bodyText1,
        hintText: 'Поиск',
        filled: true,
        fillColor: Colors.black.withOpacity(0.6),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: theme.cardColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: theme.cardColor, width: 2),
        ),
      ),
    );
  }
}
