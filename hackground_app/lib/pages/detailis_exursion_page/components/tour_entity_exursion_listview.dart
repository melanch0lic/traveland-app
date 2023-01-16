import 'package:flutter/cupertino.dart';

import '../../../data/network/models/entity/tour_entity.dart';
import '../../../domain/models/attraction_model.dart';

import 'small_exursion_card.dart';

class TourEntityExursionListview extends StatelessWidget {
  final List<TourEntity> excursions;

  const TourEntityExursionListview(this.excursions, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            SmallExursionCard(excursion: excursions[index]),
        itemCount: excursions.length,
      ),
    );
  }
}
