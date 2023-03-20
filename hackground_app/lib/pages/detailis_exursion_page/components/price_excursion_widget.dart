import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/network/models/entity/tour_entity.dart';

class PriceExcursionWidget extends StatelessWidget {
  const PriceExcursionWidget({
    Key? key,
    required this.selectedModel,
  }) : super(key: key);

  final TourEntity selectedModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        SvgPicture.asset(
          'assets/images/wallet_icon.svg',
          color: theme.primaryColorDark,
        ),
        const SizedBox(width: 5),
        Text(
          '${selectedModel.price.valueString} ',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 16,
                color: const Color.fromRGBO(44, 44, 46, 1),
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
