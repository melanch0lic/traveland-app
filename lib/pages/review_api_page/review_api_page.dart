import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/network/models/entity/review_api_entity.dart';
import '../../widgets/review_rating_widget_details.dart';
import 'components/full_review_api_card.dart';

class ReviewApiPage extends StatelessWidget {
  final List<ReviewApiEntity> reviews;
  final double meanRating;
  const ReviewApiPage({Key? key, required this.reviews, required this.meanRating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          highlightColor: theme.cardColor,
          splashRadius: 15,
          icon: SvgPicture.asset(
            'assets/images/back_arrow_icon.svg',
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Отзывы',
          style:
              theme.textTheme.displayMedium!.copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        backgroundColor: theme.primaryColorLight,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(children: [
          const SizedBox(height: 20),
          ReviewRatingWidgetDetails(meanRating: meanRating, ratingCount: reviews.length),
          const SizedBox(height: 15),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: reviews.length,
                  itemBuilder: (context, index) => FullReviewApiCard(
                        review: reviews[index],
                      )),
            ),
          ),
        ]),
      ),
    );
  }
}
