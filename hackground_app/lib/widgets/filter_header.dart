import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterHeader extends StatelessWidget {
  const FilterHeader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AnimatedCrossFade(
            firstChild: InkWell(
              onTap: () {},
              child: Row(children: [
                SvgPicture.asset(
                  'assets/images/sort_up_icon.svg',
                  color: theme.primaryColorDark,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'По стоимости',
                  style: theme.textTheme.bodyMedium!.copyWith(color: theme.primaryColorDark),
                )
              ]),
            ),
            secondChild: Row(children: [
              SvgPicture.asset('assets/images/sort_down_icon.svg', color: theme.primaryColorDark),
              const SizedBox(
                width: 5,
              ),
              Text(
                'По удаленности',
                style: theme.textTheme.bodyMedium!.copyWith(color: theme.primaryColorDark),
              )
            ]),
            crossFadeState: CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 400))
      ],
    );
  }
}
