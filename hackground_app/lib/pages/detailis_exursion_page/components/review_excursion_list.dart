import 'package:flutter/material.dart';

import '../../../data/network/models/entity/review_entity.dart';
import 'review_card.dart';

class ReviewExcursionList extends StatelessWidget {
  final List<ReviewEntity> reviews;
  const ReviewExcursionList({Key? key, required this.reviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
