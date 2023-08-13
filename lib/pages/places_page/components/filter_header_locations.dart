import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../navigation/router.gr.dart';
import '../places_page_model.dart';

class FilterHeaderLocations extends StatelessWidget {
  const FilterHeaderLocations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sortFlag = context.select((PlacesPageViewModel model) => model.sortFlagLocations);
    final sortName = context.select((PlacesPageViewModel model) => model.sortByPlaces);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 200,
          child: AnimatedCrossFade(
            firstChild: GestureDetector(
              onTap: () {
                context.read<PlacesPageViewModel>().onSortFlagLocationsPressed();
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
                context.read<PlacesPageViewModel>().onSortFlagLocationsPressed();
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
        GestureDetector(
          onTap: () => context.router.push(FilterLocationsRoute(viewModel: context.read<PlacesPageViewModel>())),
          child: Row(
            children: [
              Text('Фильтры', style: theme.textTheme.bodyMedium!.copyWith(color: theme.primaryColorDark)),
              const SizedBox(width: 5),
              SvgPicture.asset(
                'assets/images/filter_icon.svg',
                color: theme.primaryColorDark,
                width: 16,
                height: 16,
              ),
            ],
          ),
        )
      ],
    );
  }
}
