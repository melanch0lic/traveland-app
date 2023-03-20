import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/network/models/entity/tour_entity.dart';

class DurationExcursionWidget extends StatelessWidget {
  const DurationExcursionWidget({
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
          'assets/images/duration.svg',
          color: theme.primaryColorDark,
        ),
        const SizedBox(width: 5),
        Text(
          selectedModel.duration != null
              ? '${selectedModel.duration!.toInt()} часов • ${selectedModel.movementType == 'car' ? 'На машине' : selectedModel.movementType == 'foot' ? 'Пешком' : 'На автобусе'} • на ${selectedModel.maxPersons} участников'
              : 'Время не указано',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: const Color.fromRGBO(44, 44, 46, 1),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }
}
