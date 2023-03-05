import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_localizations.dart';
import '../navigation/router.gr.dart';
import '../pages/tabs_page/tabs_page_model.dart';

class NameRowHeaderPlaces extends StatelessWidget {
  final String name;

  const NameRowHeaderPlaces({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: theme.textTheme.displayMedium?.copyWith(
            color: const Color.fromRGBO(44, 44, 46, 1),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
          onPressed: () {
            context.read<TabsPageViewModel>().changeRouterIndex(1);
            context.navigateTo(const PlacesRouter());
            Future.delayed(const Duration(milliseconds: 300)).whenComplete(() => context
                .read<TabsPageViewModel>()
                .placesController!
                .animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut));
          },
          child: Text(
            translate(context, 'more_text'),
            style: theme.textTheme.bodyLarge?.copyWith(
              color: const Color.fromRGBO(37, 65, 178, 1),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
