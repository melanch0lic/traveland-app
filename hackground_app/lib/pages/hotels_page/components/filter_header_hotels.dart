import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../hotels_page_model.dart';

class FilterHeaderHotels extends StatelessWidget {
  const FilterHeaderHotels({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sortFlag = context.select(
      (HotelsPageViewModel model) => model.sortFlag,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AnimatedCrossFade(
            firstChild: InkWell(
              onTap: () {
                context.read<HotelsPageViewModel>().onSortFlagPressed();
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
                  'По стоимости',
                  style: theme.textTheme.bodyText2!.copyWith(color: theme.primaryColorDark),
                )
              ]),
            ),
            secondChild: InkWell(
              onTap: () {
                context.read<HotelsPageViewModel>().onSortFlagPressed();
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
                  'По удаленности',
                  style: theme.textTheme.bodyText2!.copyWith(color: theme.primaryColorDark),
                )
              ]),
            ),
            crossFadeState: sortFlag ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 100),
          ),
        ),
        const Spacer(),
        SvgPicture.asset(
          'assets/images/filter_icon.svg',
          color: theme.primaryColorDark,
          width: 16,
          height: 16,
        )
      ],
    );
  }
}
