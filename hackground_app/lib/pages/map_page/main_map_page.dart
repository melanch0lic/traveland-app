import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../app_initialization.dart';
import '../detailis_event_page/components/contact_event_widget.dart';
import '../detailis_event_page/components/review_event_widget.dart';
import '../detailis_event_page/components/url_event_widget.dart';
import 'components/gps_button.dart';
import 'components/location_widget.dart';
import 'components/map_category_select_widget.dart';
import 'components/search_map_widget.dart';
import 'components/zoom_buttons.dart';
import 'map_page_model.dart';

class MainMapPage extends StatelessWidget {
  const MainMapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MapPageViewModel(
          context.read<InitializeProvider>().osrmService, context.read<InitializeProvider>().cachedDataRepository),
      child: Builder(builder: (context) {
        final theme = Theme.of(context);
        final currentLocationPosition = context.select((MapPageViewModel model) => model.currentLocationPosition);
        final points = context.select((MapPageViewModel model) => model.polylinePoints);
        final selectedPlace = context.select((MapPageViewModel model) => model.selectedPlace);
        final eventMarkers = context.select((MapPageViewModel model) => model.eventMarkers);
        final housingMarkers = context.select((MapPageViewModel model) => model.housingMarkers);
        final locationMarkers = context.select((MapPageViewModel model) => model.locationMarkers);
        final selectedPlaceType = context.select((MapPageViewModel model) => model.selectedPlaceType);
        return Scaffold(
          body: Stack(children: [
            FlutterMap(
              mapController: context.read<MapPageViewModel>().mapController,
              options: MapOptions(
                  onTap: (tapPosition, point) {},
                  interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                  center: currentLocationPosition,
                  zoom: 16,
                  maxZoom: 17,
                  minZoom: 8),
              nonRotatedChildren: [
                Stack(children: [
                  SafeArea(
                      child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: const [
                        SearchMapWidget(),
                        MapCategorySelectWidget(),
                      ],
                    ),
                  )),
                  Positioned(
                      right: 10,
                      top: MediaQuery.of(context).size.height / 2 - 100,
                      child: Column(
                        children: const [
                          ZoomButtons(),
                          SizedBox(height: 15),
                          GpsButton(),
                        ],
                      )),
                ])
              ],
              children: [
                TileLayer(
                  retinaMode: MediaQuery.of(context).devicePixelRatio > 1.0,
                  urlTemplate: 'https://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.hackground_app',
                  subdomains: const [
                    'a',
                    'b',
                  ],
                  // errorImage: const NetworkImage('https://tile.openstreetmap.org/18/0/0.png'),
                ),
                PolylineLayer(
                  polylineCulling: true,
                  polylines: [
                    Polyline(strokeWidth: 4, points: points, color: Theme.of(context).highlightColor),
                  ],
                ),
                if (selectedPlaceType == PlaceType.event)
                  MarkerLayer(
                    markers: eventMarkers,
                  ),
                if (selectedPlaceType == PlaceType.location)
                  MarkerLayer(
                    markers: locationMarkers,
                  ),
                if (selectedPlaceType == PlaceType.housing)
                  MarkerLayer(
                    markers: housingMarkers,
                  ),
                if (currentLocationPosition != null)
                  MarkerLayer(
                    markers: [
                      Marker(
                        width: 60,
                        height: 60,
                        point: currentLocationPosition,
                        builder: (context) => const LocationWidget(),
                      )
                    ],
                  ),
              ],
            ),
            selectedPlace != null
                ? SlidingUpPanel(
                    padding: const EdgeInsets.all(15),
                    minHeight: MediaQuery.of(context).size.height * 0.15,
                    maxHeight: MediaQuery.of(context).size.height * 0.85,
                    backdropEnabled: true,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                    panel: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${selectedPlace.placeInfo.name} • 0+',
                              style: theme.textTheme.headline2!
                                  .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              ),
                              onPressed: () {
                                context.read<MapPageViewModel>().onDrawRouteButtonPressed();
                              },
                              child: const Text('Маршрут'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        ReviewEventWidget(theme: theme),
                        const SizedBox(height: 5),
                        CarouselSlider.builder(
                          itemCount: [
                            'https://i.pinimg.com/564x/59/fa/0c/59fa0cbe6745f482b5df4bbb08d371df.jpg',
                            'https://i.pinimg.com/564x/09/25/19/092519cf8a856ecd8427ed4e38dc77dc.jpg'
                          ].length,
                          options: CarouselOptions(
                            initialPage: [
                                      'https://i.pinimg.com/564x/59/fa/0c/59fa0cbe6745f482b5df4bbb08d371df.jpg',
                                      'https://i.pinimg.com/564x/09/25/19/092519cf8a856ecd8427ed4e38dc77dc.jpg'
                                    ].length >
                                    1
                                ? 1
                                : 0,
                            enableInfiniteScroll: false,
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                          ),
                          itemBuilder: (context, index, realIdx) {
                            return Image.network(
                                [
                                  'https://i.pinimg.com/564x/59/fa/0c/59fa0cbe6745f482b5df4bbb08d371df.jpg',
                                  'https://i.pinimg.com/564x/09/25/19/092519cf8a856ecd8427ed4e38dc77dc.jpg'
                                ][index],
                                fit: BoxFit.cover,
                                width: 1000);
                          },
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Описание',
                          style: Theme.of(context).textTheme.headline1?.copyWith(
                                fontSize: 20,
                                color: const Color.fromRGBO(44, 44, 46, 1),
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          '${selectedPlace.placeInfo.description}',
                          style: theme.textTheme.bodyText1!
                              .copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Контакты',
                          style: Theme.of(context).textTheme.headline1?.copyWith(
                                fontSize: 20,
                                color: const Color.fromRGBO(44, 44, 46, 1),
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        const SizedBox(height: 15),
                        ContactEventWidget(theme: theme),
                        const SizedBox(height: 10),
                        UrlEventWidget(theme: theme),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ]),
        );
      }),
    );
  }
}
