import 'package:flutter/cupertino.dart';

import '../../../domain/models/attraction_model.dart';

import 'attraction_card_general.dart';

class AttractionListView extends StatelessWidget {
  final List<Attraction> attractionList;

  const AttractionListView(this.attractionList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 282,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            AttractionCardGeneral(attractionList[index]),
        itemCount: attractionList.length,
      ),
    );
  }
}
