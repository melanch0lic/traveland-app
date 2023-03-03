import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../places_page_model.dart';
import 'filter_header_events.dart';
import 'location_card.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLoading = context.select((PlacesPageViewModel model) => model.isLocationsLoading);
    final places = context.select((PlacesPageViewModel model) => model.places);
    return isLoading
        ? Center(
            child: SpinKitSpinningLines(color: theme.indicatorColor),
          )
        : Padding(
            padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
            child: Column(
              children: [
                const FilterHeaderEvents(),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: places.length,
                    itemBuilder: (context, index) => LocationCard(
                      place: places[index],
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
