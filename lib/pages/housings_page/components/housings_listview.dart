import 'package:flutter/material.dart';

import '../../../data/network/models/entity/housing_entity.dart';
import 'housing_card.dart';

class HousingsListView extends StatelessWidget {
  final List<HousingEntity> housings;

  const HousingsListView(this.housings, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => HousingCard(housings[index]),
        itemCount: housings.length,
      ),
    );
  }
}
