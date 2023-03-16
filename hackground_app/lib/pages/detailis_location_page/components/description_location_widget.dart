import 'package:flutter/material.dart';

import '../../../data/network/models/entity/place_entity.dart';

class DescriptionLocationWidget extends StatelessWidget {
  const DescriptionLocationWidget({
    Key? key,
    required this.selectedModel,
    required this.theme,
  }) : super(key: key);

  final PlaceEntity selectedModel;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Text(
      selectedModel.placeInfo.description.value,
      style: theme.textTheme.bodyLarge!.copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
    );
  }
}
