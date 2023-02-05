import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';

import '../map_page_model.dart';
import 'location_widget.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentLocationPosition = context.select((MapPageViewModel model) => model.currentLocationPosition);
    final points = context.select((MapPageViewModel model) => model.polylinePoints);
    final eventMarkers = context.select((MapPageViewModel model) => model.eventMarkers);
    final housingMarkers = context.select((MapPageViewModel model) => model.housingMarkers);
    final locationMarkers = context.select((MapPageViewModel model) => model.locationMarkers);
    final selectedPlaceType = context.select((MapPageViewModel model) => model.selectedPlaceType);

    return FlutterMap(
      mapController: context.read<MapPageViewModel>().mapController,
      options: MapOptions(
          onTap: (tapPosition, point) {},
          interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
          center: currentLocationPosition,
          zoom: 16,
          maxZoom: 17,
          minZoom: 8),
      children: [
        TileLayer(
          // retinaMode: MediaQuery.of(context).devicePixelRatio > 1.0,
          urlTemplate: 'https://osm.rrze.fau.de/osmhd/{z}/{x}/{y}.png',
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
    );
  }
}
