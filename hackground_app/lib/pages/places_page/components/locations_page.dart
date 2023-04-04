import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../widgets/up_scroll_widget.dart';
import '../places_page_model.dart';
import 'filter_header_locations.dart';
import 'location_card.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> sortList = [
      ListTile(
        onTap: () => context.read<PlacesPageViewModel>().sortPlacesParametersChange('name', 'asc'),
        title: Text(
          'По названию',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16, color: Colors.black),
        ),
      ),
      ListTile(
        onTap: () => context.read<PlacesPageViewModel>().sortPlacesParametersChange('avg_rating', 'asc'),
        title: Text(
          'По рейтингу',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16, color: Colors.black),
        ),
      ),
      ListTile(
        onTap: () => context.read<PlacesPageViewModel>().sortPlacesParametersChange('rating_count', 'desc'),
        title: Text(
          'По количеству отзывов',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16, color: Colors.black),
        ),
      ),
    ];
    final theme = Theme.of(context);
    final isLoading = context.select((PlacesPageViewModel model) => model.isLocationsLoading);
    final places = context.select((PlacesPageViewModel model) => model.places);
    final sortFlag = context.select(
      (PlacesPageViewModel model) => model.sortFlagLocations,
    );
    return isLoading
        ? Center(
            child: SpinKitSpinningLines(color: theme.indicatorColor),
          )
        : Stack(children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              child: Column(
                children: [
                  const FilterHeaderLocations(),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: ListView.builder(
                            controller: context.read<PlacesPageViewModel>().locationController,
                            physics: const BouncingScrollPhysics(),
                            itemCount: places.length,
                            itemBuilder: (context, index) => LocationCard(place: places[index])),
                      ),
                      sortFlag
                          ? Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color.fromRGBO(149, 157, 165, 0.25),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      ),
                                    ]),
                                child: ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => sortList[index],
                                    separatorBuilder: (context, index) => const Divider(),
                                    itemCount: sortList.length),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ]),
                  ),
                ],
              ),
            ),
            UpScrollWidget(callback: () {
              context
                  .read<PlacesPageViewModel>()
                  .locationController
                  .animateTo(0, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
            }),
          ]);
  }
}
