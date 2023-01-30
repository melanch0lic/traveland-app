import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/network/models/entity/tour_entity.dart';

class PriceExcursionWidget extends StatelessWidget {
  const PriceExcursionWidget({
    Key? key,
    required this.theme,
    required this.selectedModel,
  }) : super(key: key);

  final ThemeData theme;
  final TourEntity selectedModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/images/wallet_icon.svg',
          color: theme.primaryColorDark,
        ),
        const SizedBox(width: 5),
        Text(
          '${selectedModel.price.value.toInt()} ₽',
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                fontSize: 16,
                color: const Color.fromRGBO(44, 44, 46, 1),
                fontWeight: FontWeight.w600,
              ),
        ),
        Text(
          ' на ${selectedModel.maxPersons} человек',
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                fontSize: 16,
                color: const Color.fromRGBO(44, 44, 46, 1),
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }
}
