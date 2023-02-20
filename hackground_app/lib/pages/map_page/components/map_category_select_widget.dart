import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../map_page_model.dart';

class MapCategorySelectWidget extends StatelessWidget {
  const MapCategorySelectWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            context.read<MapPageViewModel>().onSelectHousingCategoryButtonPressed();
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Colors.black.withOpacity(0.6),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          ),
          child: Text('Жильё', style: theme.textTheme.bodyText1!.copyWith(fontSize: 14)),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            context.read<MapPageViewModel>().onSelectLocationCategoryButtonPressed();
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Colors.black.withOpacity(0.6),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          ),
          child: Text('Локации', style: theme.textTheme.bodyText1!.copyWith(fontSize: 14)),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            context.read<MapPageViewModel>().onSelectEventCategoryButtonPressed();
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Colors.black.withOpacity(0.6),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          ),
          child: Text('События', style: theme.textTheme.bodyText1!.copyWith(fontSize: 14)),
        ),
      ],
    );
  }
}
