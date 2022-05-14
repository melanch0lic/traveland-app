import 'package:flutter/material.dart';

import 'guide_card.dart';
import '../dummy_data.dart';

class GuideListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemBuilder: (context, index) => GuideCard(guideList[index]),
      itemCount: guideList.length,
    ));
  }
}
