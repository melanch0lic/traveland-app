import 'package:flutter/material.dart';

import '../../../data/network/models/entity/tour_entity.dart';

String formatFeedback(int count) {
  if (count % 10 == 1 && count % 100 != 11) {
    return '$count отзыв';
  } else if ([2, 3, 4].contains(count % 10) && ![12, 13, 14].contains(count % 100)) {
    return '$count отзыва';
  } else {
    return '$count отзывов';
  }
}

class ReviewExursionWidget extends StatelessWidget {
  const ReviewExursionWidget({
    Key? key,
    required this.selectedModel,
  }) : super(key: key);

  final TourEntity selectedModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(
          width: 42,
          height: 27,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: const Color.fromRGBO(56, 176, 0, 1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10.5),
            child: Text(
              selectedModel.rating.toStringAsFixed(1),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: const Color.fromRGBO(255, 255, 255, 1),
                fontSize: 14,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          formatFeedback(selectedModel.reviewCount),
          style: theme.textTheme.bodyLarge!.copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
