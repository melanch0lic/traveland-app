import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../dummy_data.dart';
import '../../housings_page/components/housings_listview.dart';
import '../places_page_model.dart';
import 'filter_header_locations.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select((PlacesPageViewModel model) => model.isLocationsLoading);
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
            child: Column(
              children: const [
                FilterHeaderLocations(),
                SizedBox(
                  height: 15,
                ),
                // HousingsListView(attractionListHouse),
              ],
            ),
          );
  }
}
