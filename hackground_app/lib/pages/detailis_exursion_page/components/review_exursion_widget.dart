import 'package:flutter/material.dart';

import '../../../data/network/models/entity/tour_entity.dart';

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
          '${selectedModel.reviewCount} отзывов',
          style: theme.textTheme.bodyLarge!.copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
