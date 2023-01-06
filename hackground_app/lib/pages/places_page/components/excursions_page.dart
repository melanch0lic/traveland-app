import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../dummy_data.dart';
import '../../hotels_page/components/attraction_listview_house_rent.dart';
import '../places_page_model.dart';
import 'filter_header_excursions.dart';

class ExcursionsPage extends StatelessWidget {
  const ExcursionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select((PlacesPageViewModel model) => model.isExcursionsLoading);
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(
              children: [
                const FilterHeaderExcursions(),
                const SizedBox(
                  height: 15,
                ),
                AttractionListViewHouse(attractionListHouse),
              ],
            ),
          );
  }
}
