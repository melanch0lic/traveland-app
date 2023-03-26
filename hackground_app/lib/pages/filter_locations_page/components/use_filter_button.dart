import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../places_page/places_page_model.dart';

class UseFilterButton extends StatelessWidget {
  const UseFilterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentCategoryMode = context.select((PlacesPageViewModel model) => model.currentCategoryMode);
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(37, 65, 178, 1),
          foregroundColor: const Color.fromRGBO(37, 65, 178, 0.2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
        ),
        onPressed: () {
          Navigator.of(context).pop();
          context.read<PlacesPageViewModel>().placeTypeIdChange(currentCategoryMode);
        },
        child: Center(
          child: Text(
            'Применить',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
