import 'package:flutter/material.dart';

import '../../../data/network/models/entity/review_entity.dart';
import 'review_card.dart';

class ReviewExcursionList extends StatelessWidget {
  final List<ReviewEntity> reviews;
  final Function callback;
  const ReviewExcursionList({Key? key, required this.reviews, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          scrollDirection: Axis.horizontal,
          itemCount: reviews.length,
          itemBuilder: (context, index) => ReviewCard(
                review: reviews[index],
                callback: callback,
              )),
    );
  }
}
