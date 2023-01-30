import 'package:flutter/material.dart';

import '../../../data/network/models/entity/tour_entity.dart';

class DescriptionExcursionWidget extends StatelessWidget {
  const DescriptionExcursionWidget({
    Key? key,
    required this.selectedModel,
    required this.theme,
    required this.isFullTextShowed,
  }) : super(key: key);

  final TourEntity selectedModel;
  final ThemeData theme;
  final bool isFullTextShowed;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: Text(
          '${selectedModel.annotation.substring(0, selectedModel.annotation.length ~/ 2)}...',
          style: theme.textTheme.bodyText1!.copyWith(
              color: theme.primaryColorDark, fontWeight: FontWeight.w400),
        ),
        secondChild: Text(
          selectedModel.annotation,
          style: theme.textTheme.bodyText1!.copyWith(
              color: theme.primaryColorDark, fontWeight: FontWeight.w400),
        ),
        crossFadeState: isFullTextShowed
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 400));
  }
}
