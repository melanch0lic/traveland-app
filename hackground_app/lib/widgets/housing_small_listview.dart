import 'package:flutter/material.dart';

import '../data/network/models/entity/housing_entity.dart';
import 'housing_small_card.dart';

class HousingSmallListView extends StatelessWidget {
  final List<HousingEntity> housings;

  const HousingSmallListView({Key? key, required this.housings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => HousingSmallCard(housing: housings[index]),
        itemCount: housings.length,
      ),
    );
  }
}
