import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../map_page_model.dart';

class SearchOpenedWidget extends StatelessWidget {
  const SearchOpenedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final focusNode = context.read<MapPageViewModel>().focusNode;
    return TextField(
      onChanged: (_) => context.read<MapPageViewModel>().onSearchTextChange(),
      controller: context.read<MapPageViewModel>().searchController,
      focusNode: focusNode,
      style: theme.textTheme.bodyText1!.copyWith(color: Colors.black),
      decoration: InputDecoration(
        prefixIcon: IconButton(
          icon: SvgPicture.asset('assets/images/back_arrow_icon.svg'),
          onPressed: () => context.read<MapPageViewModel>().changeSearchState(),
        ),
        suffixIcon: Icon(Icons.keyboard_voice, color: theme.cardColor),
        contentPadding: const EdgeInsets.all(15),
        hintStyle: theme.textTheme.bodyText1,
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: theme.textTheme.bodyText2!.color!, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: theme.highlightColor, width: 2),
        ),
      ),
    );
  }
}
