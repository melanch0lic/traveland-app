import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/review_place_small_card.dart';
import '../details_page_model.dart';

class ReviewHousingList extends StatelessWidget {
  const ReviewHousingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reviews = context.select((DetailsHousingPageViewModel model) => model.reviews);
    return SizedBox(
      height: 185,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: reviews.length,
          itemBuilder: (context, index) => ReviewPlaceSmallCard(
                review: reviews[index],
              )),
    );
  }
}
