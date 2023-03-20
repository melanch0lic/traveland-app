import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../detailis_exursion_page_model.dart';
import 'review_card.dart';

class ReviewExcursionList extends StatelessWidget {
  const ReviewExcursionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reviews = context.select((DetailsExursionPageViewModel model) => model.reviews);
    return SizedBox(
      height: 185,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: reviews.length,
          itemBuilder: (context, index) => ReviewCard(
                review: reviews[index],
              )),
    );
  }
}
