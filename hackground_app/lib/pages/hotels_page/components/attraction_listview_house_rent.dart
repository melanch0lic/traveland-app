import 'package:flutter/material.dart';

import '../../../domain/models/attraction_model.dart';
import 'attraction_category_card_house.dart';

class AttractionListViewHouse extends StatelessWidget {
  final List<Attraction> attractionListHouse;

  const AttractionListViewHouse(this.attractionListHouse, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => AttractionCategoryCardHouse(attractionListHouse[index]),
        itemCount: attractionListHouse.length,
      ),
    );
  }
}
