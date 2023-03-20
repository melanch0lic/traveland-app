import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../../app_initialization.dart';
import 'components/sent_write_review_button_excursions.dart';
import 'components/write_review_textfield.dart';
import 'write_review_page_model.dart';

class WriteReviewPage extends StatelessWidget {
  final int placeId;
  const WriteReviewPage({Key? key, required this.placeId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) =>
          WriteReviewPageViewModel(placeId: placeId, reviewsService: context.read<InitializeProvider>().reviewsService),
      child: Builder(builder: (context) {
        final rating = context.select((WriteReviewPageViewModel model) => model.rating);
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
              tr('sent_review'),
              style: theme.textTheme.displayMedium!
                  .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
            ),
            backgroundColor: theme.primaryColorLight,
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 30),
              Text(
                tr('rate_place'),
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 20,
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 10),
              SmoothStarRating(
                allowHalfRating: false,
                onRatingChanged: (v) {
                  context.read<WriteReviewPageViewModel>().onRatingChange(v.toInt());
                },
                rating: rating.toDouble(),
                size: 40.0,
                filledIconData: Icons.star,
                halfFilledIconData: Icons.blur_on,
                color: const Color.fromRGBO(253, 197, 0, 1),
                borderColor: const Color.fromRGBO(253, 197, 0, 1),
              ),
              const SizedBox(height: 30),
              Text(
                tr('review_text'),
                style: theme.textTheme.bodyLarge!.copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 10),
              const WriteReviewTextfield(),
              const SizedBox(height: 30),
              const SentWriteReviewButtonExcursions()
            ]),
          ),
        );
      }),
    );
  }
}
