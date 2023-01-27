import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../map_page_model.dart';

class ZoomButtons extends StatelessWidget {
  const ZoomButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => context.read<MapPageViewModel>().increaseCurrentZoomLevel(),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: SvgPicture.asset(
                'assets/images/plus_icon.svg',
                color: theme.cardColor,
              ),
            ),
          ),
          InkWell(
            onTap: () => context.read<MapPageViewModel>().reduceCurrentZoomLevel(),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: SvgPicture.asset(
                'assets/images/minus_icon.svg',
                color: theme.cardColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
