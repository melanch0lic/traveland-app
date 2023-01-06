import 'package:flutter/material.dart';

import '../../../dummy_data.dart';
import '../../hotels_page/components/attraction_listview_house_rent.dart';
import 'filter_header_excursions.dart';

class ExcursionsPage extends StatelessWidget {
  const ExcursionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
