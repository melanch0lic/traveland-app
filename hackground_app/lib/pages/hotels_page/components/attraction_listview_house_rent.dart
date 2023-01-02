import 'package:flutter/material.dart';

import '../../../domain/models/attraction_model.dart';
import '../../../dummy_data.dart';
import '../../../widgets/attraction_category_card_events.dart';
import '../../../widgets/attraction_category_card_place.dart';
import 'attraction_category_card_house.dart';

class AttractionListViewHouse extends StatelessWidget {
  final List<Attraction> attractionListHouse;

  const AttractionListViewHouse(this.attractionListHouse, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            AttractionCategoryCardHouse(attractionListHouse[index]),
        itemCount: attractionListHouse.length,
      ),
    );
  }
}
