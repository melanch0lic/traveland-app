import 'package:flutter/material.dart';

import '../models/attraction_model.dart';
import 'attraction_card_house_widget.dart';

class AttractionListViewHouse extends StatelessWidget {
  final List<Attraction> attractionList;

  AttractionListViewHouse(this.attractionList);
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            AttractionCardHouse(attractionList[index]),
        itemCount: attractionList.length,
      ),
    );
  }
}
