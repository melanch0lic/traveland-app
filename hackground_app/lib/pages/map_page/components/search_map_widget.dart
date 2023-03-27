import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../map_page_model.dart';

class SearchMapWidget extends StatelessWidget {
  const SearchMapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      onTap: () {
        context.read<MapPageViewModel>().changeSearchState();
      },
      readOnly: true,
      style: theme.textTheme.bodyLarge,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: theme.cardColor),
        contentPadding: const EdgeInsets.all(15),
        hintStyle: theme.textTheme.bodyLarge,
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
