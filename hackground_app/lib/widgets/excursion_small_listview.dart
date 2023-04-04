import 'package:flutter/material.dart';

import '../data/network/models/entity/tour_entity.dart';
import 'excursion_small_card.dart';

class ExcursionSmallListView extends StatelessWidget {
  final List<TourEntity> excursions;

  const ExcursionSmallListView({Key? key, required this.excursions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ExcursionSmallCard(excursion: excursions[index]),
        itemCount: excursions.length,
      ),
    );
  }
}
