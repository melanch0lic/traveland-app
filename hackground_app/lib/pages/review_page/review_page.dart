import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackground_app/pages/review_page/review_page_model.dart';
import 'package:provider/provider.dart';
import '../../app_initialization.dart';
import '../../data/network/models/entity/tour_entity.dart';
import '../../dummy_data.dart';
import 'components/full_review_card.dart';
import 'components/sent_review_button_excursions.dart';

class ReviewPage extends StatelessWidget {
  final TourEntity selectedModel;
  const ReviewPage({Key? key, required this.selectedModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> sortList = [
      'Сначала популярные',
      'Сначала положительные',
      'Сначала отрицательные',
      'Сначала новые',
      'Сначала старые'
    ];

    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => ReviewPageViewModel(
          context.read<InitializeProvider>().excursionsService,
          selectedModel.id),
      child: Builder(builder: (context) {
        final isLoadingMore = context
            .select((ReviewPageViewModel model) => model.isReviewsLoadingMore);
        final isLoading = context.select(
          (ReviewPageViewModel model) => model.isLoading,
        );
        final reviews = context.select(
          (ReviewPageViewModel model) => model.reviews,
        );
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
              style: theme.textTheme.headline2!.copyWith(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            backgroundColor: theme.primaryColorLight,
          ),
          body: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Column(children: [
                    //FilterHeaderReviews(),
                    SizedBox(height: 20),
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
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10.5),
                            child: Text(
                              selectedModel.rating.toStringAsFixed(1),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 14,
                                  ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${selectedModel.reviewCount} отзывов',
                          style: theme.textTheme.bodyText1!.copyWith(
                              color: theme.primaryColorDark,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Expanded(
                      child: ListView.builder(
                          controller: context
                              .read<ReviewPageViewModel>()
                              .reviewController,
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          itemCount: reviews.length,
                          itemBuilder: (context, index) =>
                              reviews.length == index + 1
                                  ? Column(
                                      children: [
                                        FullReviewCard(review: reviews[index]),
                                        if (isLoadingMore)
                                          const CircularProgressIndicator()
                                      ],
                                    )
                                  : FullReviewCard(
                                      review: reviews[index],
                                    )),
                    ),
                  ]),
                ),
        );
      }),
    );
  }
}
