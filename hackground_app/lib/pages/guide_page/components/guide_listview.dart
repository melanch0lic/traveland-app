import 'package:flutter/material.dart';

import 'guide_card.dart';
import '../../../dummy_data.dart';

class GuideListView extends StatelessWidget {
  const GuideListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => GuideCard(guideList[index]),
      itemCount: guideList.length,
    ));
  }
}
