import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../places_page_model.dart';

class FilterHeaderEvents extends StatelessWidget {
  const FilterHeaderEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sortFlag = context.select((PlacesPageViewModel model) => model.sortFlagEvents);
    final sortName = context.select((PlacesPageViewModel model) => model.sortByEvents);
    return Row(
      children: [
        Expanded(
          child: AnimatedCrossFade(
            firstChild: InkWell(
              onTap: () {
                context.read<PlacesPageViewModel>().onSortFlagEventsPressed();
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
                  sortName == 'name'
                      ? 'По названию'
                      : sortName == 'avg_rating'
                          ? 'По рейтингу'
                          : 'По количеству отзывов',
                  style: theme.textTheme.bodyMedium!.copyWith(color: theme.primaryColorDark),
                )
              ]),
            ),
            secondChild: InkWell(
              onTap: () {
                context.read<PlacesPageViewModel>().onSortFlagEventsPressed();
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
                  sortName == 'name'
                      ? 'По названию'
                      : sortName == 'avg_rating'
                          ? 'По рейтингу'
                          : 'По количеству отзывов',
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
