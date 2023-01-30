import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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
      create: (context) => MapPageViewModel(),
      child: Builder(builder: (context) {
        final currentLocationPosition = context.select((MapPageViewModel model) => model.currentLocationPosition);
        return Scaffold(
          body: SlidingUpPanel(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            collapsed: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))),
              child: const Center(
                child: Text(
                  'Исследуй Осетию',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),
            ),
            panel: const Center(child: Text('Основной контент')),
            body: FlutterMap(
              mapController: context.read<MapPageViewModel>().mapController,
              options: MapOptions(
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
                  )
              ],
            ),
          ),
        );
      }),
    );
  }
}
