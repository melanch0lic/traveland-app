import 'package:flutter/material.dart';

import '../data/network/models/entity/review_api_entity.dart';
import 'review_place_small_card.dart';

class ReviewSmallList extends StatelessWidget {
  final List<ReviewApiEntity> reviews;
  const ReviewSmallList({Key? key, required this.reviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
