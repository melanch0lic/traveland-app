import 'package:flutter/material.dart';

import '../../../data/network/models/entity/place_entity.dart';

class DescriptionLocationWidget extends StatelessWidget {
  const DescriptionLocationWidget({
    Key? key,
    required this.selectedModel,
    required this.theme,
    required this.isFullTextShowed,
  }) : super(key: key);

  final PlaceEntity selectedModel;
  final ThemeData theme;
  final bool isFullTextShowed;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: Text(
          selectedModel.placeInfo.description.value,
          style: theme.textTheme.bodyLarge!.copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
        ),
        secondChild: Text(
          selectedModel.placeInfo.description.value,
          style: theme.textTheme.bodyLarge!.copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
        ),
        crossFadeState: isFullTextShowed ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 400));
  }
}
