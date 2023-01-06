import 'package:flutter/material.dart';

import '../../../dummy_data.dart';
import '../../hotels_page/components/attraction_listview_house_rent.dart';
import 'filter_header_locations.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      child: Column(
        children: [
          const FilterHeaderLocations(),
          const SizedBox(
            height: 15,
          ),
          AttractionListViewHouse(attractionListHouse),
        ],
      ),
    );
  }
}
