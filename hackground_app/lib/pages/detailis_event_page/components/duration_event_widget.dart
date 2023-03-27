import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/network/models/entity/event_entity.dart';

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
          '${DateTime.parse(selectedModel.eventEndTime.value).hour - DateTime.parse(selectedModel.eventStartTime.value).hour} часов',
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
