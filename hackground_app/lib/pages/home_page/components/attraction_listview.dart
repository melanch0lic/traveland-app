import 'package:flutter/cupertino.dart';

import '../../../models/attraction_model.dart';
import 'attraction_card.dart';

class AttractionListView extends StatelessWidget {
  final List<Attraction> attractionList;

  const AttractionListView(this.attractionList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 165,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => AttractionCard(attractionList[index]),
          itemCount: attractionList.length,
        ));
  }
}
