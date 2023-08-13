import 'package:flutter/material.dart';

String formatFeedback(int count) {
  if (count % 10 == 1 && count % 100 != 11) {
    return '$count отзыв';
  } else if ([2, 3, 4].contains(count % 10) && ![12, 13, 14].contains(count % 100)) {
    return '$count отзыва';
  } else {
    return '$count отзывов';
  }
}

class ReviewRatingWidget extends StatelessWidget {
  final selectedModel;
  const ReviewRatingWidget({Key? key, required this.selectedModel}) : super(key: key);

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
            color: selectedModel.placeInfo.meanRating.value.toInt() >= 4
                ? const Color.fromRGBO(56, 176, 0, 1)
                : selectedModel.placeInfo.meanRating.value.toInt() == 0
                    ? Colors.grey
                    : selectedModel.placeInfo.meanRating.value.toInt() <= 2
                        ? const Color.fromRGBO(255, 47, 47, 1)
                        : const Color.fromRGBO(253, 197, 0, 1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10.5),
            child: Text(
              selectedModel.placeInfo.meanRating.value.toStringAsFixed(1),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
          selectedModel.placeInfo.meanRating.value.toInt() == 0
              ? 'Нет отзывов'
              : formatFeedback(selectedModel.placeInfo.ratingCount.value.toInt()),
          style: theme.textTheme.bodyLarge!.copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
