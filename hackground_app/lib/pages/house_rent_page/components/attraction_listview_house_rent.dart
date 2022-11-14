import 'package:flutter/material.dart';

import '../../../models/attraction_model.dart';
import 'attraction_card_house_widget.dart';

class AttractionListViewHouse extends StatelessWidget {
  final List<Attraction> attractionList;

  const AttractionListViewHouse(this.attractionList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => AttractionCardHouse(attractionList[index]),
        itemCount: attractionList.length,
      ),
    );
  }
}
