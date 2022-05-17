import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    final double sizeWidth = MediaQuery.of(context).size.width;
    final double sizeHeight = MediaQuery.of(context).size.height;
    return Stack(children: [
      FlutterMap(
        options: MapOptions(
          center: LatLng(44.0486, 43.0594),
          zoom: 13.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
            attributionBuilder: (_) {
              return const Text("© OpenStreetMap contributors");
            },
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(44.0486, 43.0594),
                builder: (ctx) => const Icon(Icons.place),
              ),
            ],
          ),
        ],
      ),
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
                            child: TextField(
                              style: const TextStyle(color: Colors.white),
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Colors.grey[500], fontSize: 18),
                                  hintText: "Поиск",
                                  fillColor: Color(0xFF000000).withOpacity(0.7),
                                  filled: true,
                                  suffixIcon: IconButton(
                                    icon: const Icon(
                                      Icons.mic,
                                      color: Color(0xFFFFFFFF),
                                      size: 24,
                                    ),
                                    onPressed: () {},
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: Color(0xFFFFFFFF),
                                    size: 24,
                                  ),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  )),
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              searchCategory('Рестораны'),
                              searchCategory('Отели'),
                              searchCategory('Магазины'),
                              searchCategory('Кино'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8, left: 8),
                    child: GestureDetector(
                      onTap: () {
                        // changeSelectedPageIndex!(6);
                      },
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      Positioned(
        left: sizeWidth * 0.85,
        top: sizeHeight * 0.4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Color(0xFF000000).withOpacity(0.7),
                  ),
                  child: const Icon(
                    Icons.zoom_in,
                    color: Colors.white,
                    size: 32,
                  )),
              const SizedBox(
                height: 4,
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: const Color(0xFF000000).withOpacity(0.7),
                  ),
                  child: const Icon(
                    Icons.zoom_out,
                    color: Colors.white,
                    size: 32,
                  )),
            ],
          ),
        ),
      ),
      Positioned(
        left: sizeWidth * 0.85,
        top: sizeHeight * 0.8,
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF000000).withOpacity(0.7),
          onPressed: () {},
          child: const Icon(Icons.near_me_outlined),
        ),
      )
    ]);
  }
}

class searchCategory extends StatelessWidget {
  final String? categoryName;

  searchCategory(this.categoryName);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        color: const Color(0xFF000000).withOpacity(0.7),
      ),
      child: Text(
        categoryName!,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
