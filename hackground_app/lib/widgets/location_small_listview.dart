import 'package:flutter/material.dart';

import '../data/network/models/entity/place_entity.dart';
import 'location_small_card.dart';

class LocationSmallListView extends StatelessWidget {
  final List<PlaceEntity> places;

  const LocationSmallListView({Key? key, required this.places}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => LocationSmallCard(place: places[index]),
        itemCount: places.length,
      ),
    );
  }
}
