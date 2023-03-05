import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../app_localizations.dart';
import '../../../data/network/models/entity/tour_entity.dart';
import '../../../navigation/router.gr.dart';

class NameRowHeaderExursion extends StatelessWidget {
  final TourEntity selectedModel;

  const NameRowHeaderExursion({Key? key, required this.selectedModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          translate(context, 'reviews_text'),
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: const Color.fromRGBO(44, 44, 46, 1),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
        ),
        TextButton(
          onPressed: () {
            context.router.push(ReviewRoute(selectedModel: selectedModel));
          },
          child: Text(
            translate(context, 'more_text'),
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
