import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../places_page_model.dart';

class FilterHeaderExcursions extends StatelessWidget {
  const FilterHeaderExcursions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sortFlag = context.select((PlacesPageViewModel model) => model.sortFlagExcursions);
    final sortingExcursions = context.select((PlacesPageViewModel model) => model.sortingExcursions);
    return Row(
      children: [
        Expanded(
          child: AnimatedCrossFade(
            firstChild: InkWell(
              onTap: () {
                context.read<PlacesPageViewModel>().onSortFlagExcursionsPressed();
              },
              child: Row(children: [
                SvgPicture.asset(
                  'assets/images/sort_up_icon.svg',
                  color: theme.primaryColorDark,
                  width: 16,
                  height: 10,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  sortingExcursions == 'popularity' ? 'По популярности' : 'По цене',
                  style: theme.textTheme.bodyMedium!.copyWith(color: theme.primaryColorDark),
                )
              ]),
            ),
            secondChild: InkWell(
              onTap: () {
                context.read<PlacesPageViewModel>().onSortFlagExcursionsPressed();
              },
              child: Row(children: [
                SvgPicture.asset(
                  'assets/images/sort_down_icon.svg',
                  color: theme.primaryColorDark,
                  width: 16,
                  height: 10,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  sortingExcursions == 'popularity' ? 'По популярности' : 'По цене',
                  style: theme.textTheme.bodyMedium!.copyWith(color: theme.primaryColorDark),
                )
              ]),
            ),
            crossFadeState: sortFlag ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 100),
          ),
        ),
      ],
    );
  }
}
