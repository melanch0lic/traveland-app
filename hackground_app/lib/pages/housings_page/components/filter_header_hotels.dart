import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../navigation/router.gr.dart';
import '../housings_page_model.dart';

class FilterHeaderHotels extends StatelessWidget {
  const FilterHeaderHotels({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sortFlag = context.select((HousingsPageViewModel model) => model.sortFlag);
    final sortName = context.select((HousingsPageViewModel model) => model.sortByHousings);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 200,
          child: AnimatedCrossFade(
            firstChild: InkWell(
              onTap: () {
                context.read<HousingsPageViewModel>().onSortFlagPressed();
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
                context.read<HousingsPageViewModel>().onSortFlagPressed();
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
        const Spacer(),
        InkWell(
          onTap: () => context.router.push(FilterHousingsRoute(viewModel: context.read<HousingsPageViewModel>())),
          child: SvgPicture.asset(
            'assets/images/filter_icon.svg',
            color: theme.primaryColorDark,
            width: 16,
            height: 16,
          ),
        )
      ],
    );
  }
}
