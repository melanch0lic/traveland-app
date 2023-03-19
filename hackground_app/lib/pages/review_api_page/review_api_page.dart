import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/network/models/entity/review_api_entity.dart';
import 'components/full_review_api_card.dart';

class ReviewApiPage extends StatelessWidget {
  final List<ReviewApiEntity> reviews;
  final selectedModel;
  const ReviewApiPage({Key? key, required this.reviews, required this.selectedModel}) : super(key: key);

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
          Row(
            children: [
              Container(
                width: 42,
                height: 27,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: const Color.fromRGBO(56, 176, 0, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10.5),
                  child: Text(
                    selectedModel.placeInfo.meanRating.value.toStringAsFixed(1),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 14,
                        ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '${selectedModel.placeInfo.ratingCount.value} отзывов',
                style: theme.textTheme.bodyLarge!.copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
              ),
            ],
          ),
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