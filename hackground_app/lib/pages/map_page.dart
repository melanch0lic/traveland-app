import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
export 'package:google_polyline_algorithm/google_polyline_algorithm.dart' show decodePolyline;

/*You may have a polyline with 'Google Polyline Encoding' (which is a lossy compression algorithm to convert coordinates into a string and back). These are often returned from routing engines, for example. In this case, you'll need to decode the polyline to the correct format first, before you can use it in a Polyline's points argument.
One way to accomplish this is to use another Flutter library called 'google_polyline_algorithm', together with a custom method. You can use the code snippet below, which can just be pasted into a file and imported whenever needed: */
extension PolylineExt on List<List<num>> {
  List<LatLng> unpackPolyline() => map((p) => LatLng(p[0].toDouble(), p[1].toDouble())).toList();
}

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

enum ChosenMode { first, second, turnedOff, accepted }

class _MapPageState extends State<MapPage> {
  Future<void> locationService() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionLocation;
    LocationData _locData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionLocation = await location.hasPermission();
    if (_permissionLocation == PermissionStatus.denied) {
      _permissionLocation = await location.requestPermission();
      if (_permissionLocation != PermissionStatus.granted) {
        return;
      }
    }

    _locData = await location.getLocation();

    setState(() {
      _latitude = _locData.latitude!;
      _longitude = _locData.longitude!;
    });
  }

  //GPS навигация
  late bool navigationMode;

  late MapController? _mapController;
  late PopupController _popupLayerController;

  double? _latitude;
  double? _longitude;

  ChosenMode chosenMode = ChosenMode.turnedOff;
  int? currentModeNumber;

  List<LatLng> points = [];

  List<Marker> get markers => points
      .map(
        (e) => Marker(
          width: 80.0,
          height: 80.0,
          point: e,
          builder: (ctx) => const Icon(Icons.place),
        ),
      )
      .toList();

  @override
  void initState() {
    locationService();
    navigationMode = false;
    _mapController = MapController();
    _popupLayerController = PopupController();

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Use `MapController` as needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black, actions: [
        if (chosenMode == ChosenMode.turnedOff)
          IconButton(
              onPressed: () {
                setState(() {
                  chosenMode = ChosenMode.first;
                  currentModeNumber = 1;
                });
              },
              icon: const Icon(Icons.looks_one)),
        if (chosenMode == ChosenMode.turnedOff)
          IconButton(
              onPressed: () {
                setState(() {
                  chosenMode = ChosenMode.second;
                  currentModeNumber = 2;
                });
              },
              icon: const Icon(Icons.looks_two)),
        if (chosenMode == ChosenMode.first || chosenMode == ChosenMode.second)
          IconButton(
              onPressed: () {
                setState(() {
                  chosenMode = ChosenMode.accepted;
                });
              },
              icon: const Icon(Icons.check)),
        if (chosenMode == ChosenMode.first || chosenMode == ChosenMode.second || chosenMode == ChosenMode.accepted)
          IconButton(
              onPressed: () {
                setState(() {
                  chosenMode = ChosenMode.turnedOff;
                  points.clear();
                });
              },
              icon: const Icon(Icons.location_off)),
      ]),
      body: SlidingUpPanel(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        collapsed: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))),
          child: const Center(
            child: Text(
              "Исследуй Осетию",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
          ),
        ),
        panel: const Center(child: Text("Основной контент")),
        body: FlutterMap(
          mapController: _mapController,
          nonRotatedChildren: [
            Positioned(
              right: 20,
              top: 20,
              child: FloatingActionButton(
                backgroundColor: navigationMode ? Colors.blue : Colors.grey,
                foregroundColor: Colors.white,
                onPressed: () {
                  setState(
                    () {
                      _mapController!.move(LatLng(_latitude!, _longitude!), 18);
                      points.add(LatLng(_latitude!, _longitude!));
                      navigationMode = !navigationMode;
                    },
                  );
                },
                child: const Icon(
                  Icons.navigation_outlined,
                ),
              ),
            )
          ],
          // Перед выгрузкой приложения в стор, мб стоит добавить
          // nonRotatedChildren: [
          //   Container(
          //     margin: const EdgeInsets.only(bottom: 150),
          //     child: AttributionWidget.defaultWidget(
          //       source: '© OpenStreetMap contributors',
          //       onSourceTapped: () {},
          //     ),
          //   ),
          // ],
          options: MapOptions(
            onTap: (tapPosition, point) {
              setState(() {
                if (chosenMode == ChosenMode.first ||
                    chosenMode == ChosenMode.second && chosenMode != ChosenMode.accepted) {
                  points.add(point);
                }
              });
              _popupLayerController.hideAllPopups();
              print('tapPosition:$tapPosition');
              print('point:$point');
            },
            interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
            center: LatLng(43.024994, 44.68126),
            zoom: 13,
            maxZoom: 19.0,
          ),
          children: [
            //Подгрузка самой карты
            TileLayer(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: const ['a', 'b', 'c'],
              errorImage: const NetworkImage('https://tile.openstreetmap.org/18/0/0.png'),
              // tileBuilder: (context, widget, tile) => Stack(
              //   fit: StackFit.passthrough,
              //   children: [
              //     widget,
              //     Center(
              //       child: Text('${tile.coords.x.floor()} : ${tile.coords.y.floor()} : ${tile.coords.z.floor()}'),
              //     ),
              //   ],
              // ),
            ),
            //Маркеры
            if (chosenMode != ChosenMode.accepted)
              MarkerLayer(
                markers: markers,
              ),
            //Умный алгоритм постройки отрезков от flutter_map
            if (chosenMode == ChosenMode.first || currentModeNumber == 1 && chosenMode == ChosenMode.accepted)
              PolygonLayer(
                polygonCulling: true,
                polygons: [
                  Polygon(
                    borderStrokeWidth: 2,
                    borderColor: Colors.black,
                    points: points,
                    color: Colors.blue,
                  ),
                ],
              ),
            //Поочередный алгоритм построения отрезков, каждый за каждым
            if (chosenMode == ChosenMode.second || currentModeNumber == 2 && chosenMode == ChosenMode.accepted)
              PolylineLayer(
                polylineCulling: true,
                polylines: [
                  Polyline(strokeWidth: 3, points: points, color: Colors.black),
                ],
              ),
            //Круговой алгоритм построения, мб для кластеризации...
            // CircleLayer(
            //   circles: [CircleMarker(point: points[0], radius: 20)],
            // ),

            if (chosenMode == ChosenMode.accepted)
              PopupMarkerLayerWidget(
                options: PopupMarkerLayerOptions(
                  popupController: _popupLayerController,
                  markers: markers,
                  markerRotateAlignment: PopupMarkerLayerOptions.rotationAlignmentFor(AnchorAlign.top),
                  popupBuilder: (BuildContext context, Marker marker) => Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [BoxShadow(spreadRadius: 5, color: Colors.black.withOpacity(0.3))]),
                    child: Text(
                        'Координаты :${marker.point.latitude.toStringAsFixed(2)} ${marker.point.longitude.toStringAsFixed(2)}'),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
