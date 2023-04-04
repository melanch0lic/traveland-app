import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/network/models/entity/event_entity.dart';

String formatTime(int hour) {
  if (hour % 10 == 1 && hour % 100 != 11) {
    return '$hour час';
  } else if ([2, 3, 4].contains(hour % 10) && ![12, 13, 14].contains(hour % 100)) {
    return '$hour часа';
  } else {
    return '$hour часов';
  }
}

class DurationEventWidget extends StatelessWidget {
  final EventsEntity selectedModel;

  const DurationEventWidget({Key? key, required this.selectedModel}) : super(key: key);

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
          formatTime(DateTime.parse(selectedModel.eventEndTime.value).hour -
              DateTime.parse(selectedModel.eventStartTime.value).hour),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: const Color.fromRGBO(44, 44, 46, 1),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
