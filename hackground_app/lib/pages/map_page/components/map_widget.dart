import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';
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
    final selectedRouteType = context.select((MapPageViewModel model) => model.selectedRouteType);
    final selectedPositions = context.select((MapPageViewModel model) => model.selectedPositions);

    return FlutterMap(
      mapController: context.read<MapPageViewModel>().mapController,
      options: MapOptions(
          onTap: (tapPosition, point) {},
          interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
          center: LatLng(43.0367, 44.6678),
          zoom: 16,
          maxZoom: 17,
          minZoom: 8),
      children: [
        TileLayer(
          urlTemplate: 'https://osm.rrze.fau.de/osmhd/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.hackground_app',
          subdomains: const [
            'a',
            'b',
          ],
        ),
        PolylineLayer(
          polylineCulling: true,
          polylines: [
            Polyline(
                strokeWidth: 5,
                points: points,
                color: Theme.of(context).highlightColor.withOpacity(0.8),
                isDotted: selectedRouteType == RouteType.foot),
            // Polyline(
            //     strokeWidth: 5,
            //     points: points.isNotEmpty ? points.sublist(0, points.indexOf(selectedPositions.first) + 1) : [],
            //     color: Colors.red.withOpacity(0.8),
            //     isDotted: selectedRouteType == RouteType.foot),
          ],
        ),
        if (selectedPlaceType == PlaceType.event || selectedPlaceType == PlaceType.all)
          MarkerLayer(
            markers: eventMarkers,
          ),
        if (selectedPlaceType == PlaceType.location || selectedPlaceType == PlaceType.all)
          MarkerLayer(
            markers: locationMarkers,
          ),
        // MarkerClusterLayerWidget(
        //     options: MarkerClusterLayerOptions(
        //   size: const Size(40, 40),
        //   anchor: AnchorPos.align(AnchorAlign.center),
        //   fitBoundsOptions: const FitBoundsOptions(padding: EdgeInsets.all(50)),
        //   markers: locationMarkers,
        //   builder: (context, markers) {
        //     return FloatingActionButton(
        //       onPressed: null,
        //       backgroundColor: Colors.red,
        //       child: Text(markers.length.toString()),
        //     );
        //   },
        // )),
        if (selectedPlaceType == PlaceType.housing || selectedPlaceType == PlaceType.all)
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
        if (selectedPositions.isNotEmpty)
          MarkerLayer(
            markers: [
              Marker(
                  point: selectedPositions.first,
                  width: 40,
                  height: 40,
                  builder: (context) => SvgPicture.asset(
                        'assets/images/location_marker_icon.svg',
                      ))
            ],
          )
      ],
    );
  }
}
