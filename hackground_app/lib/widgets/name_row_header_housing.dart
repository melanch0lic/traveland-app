import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../data/network/models/entity/review_api_entity.dart';
import '../navigation/router.gr.dart';

class NameRowHeaderReviewDetails extends StatelessWidget {
  final selectedModel;
  final List<ReviewApiEntity> reviews;
  const NameRowHeaderReviewDetails({Key? key, required this.selectedModel, required this.reviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          tr('reviews_text'),
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: const Color.fromRGBO(44, 44, 46, 1),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
        ),
        TextButton(
          onPressed: () {
            context.router.push(ReviewApiRoute(selectedModel: selectedModel, reviews: reviews));
          },
          child: Text(
            tr('more_text'),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: const Color.fromRGBO(37, 65, 178, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
      ],
    );
  }
}
