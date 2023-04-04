import 'package:flutter/material.dart';

import '../../../data/network/models/entity/tour_entity.dart';

class ReviewEventWidget extends StatelessWidget {
  const ReviewEventWidget({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              '4.9',
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
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
          '2910 отзывов',
          style: theme.textTheme.bodyText1!.copyWith(
              color: theme.primaryColorDark, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
