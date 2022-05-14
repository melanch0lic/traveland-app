import 'package:flutter/cupertino.dart';
import 'package:hackground_app/models/attraction_model.dart';
import 'package:hackground_app/widgets/attraction_card.dart';

class AttractionListView extends StatelessWidget {
  final List<Attraction> attractionList;

  AttractionListView(this.attractionList);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => AttractionCard(attractionList[index]),
      itemCount: attractionList.length,
    ));
  }
}
