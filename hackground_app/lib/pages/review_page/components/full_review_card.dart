import 'package:flutter/material.dart';

import '../../../data/network/models/entity/review_entity.dart';
import '../../../domain/models/review.dart';

class FullReviewCard extends StatelessWidget {
  final ReviewEntity review;
  const FullReviewCard({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(149, 157, 165, 0.25),
            )
          ]),
      child: Column(children: [
        Row(
          children: [
            CircleAvatar(
              maxRadius: 25,
              backgroundImage: review.avatars.mediumAvatarUrl != null
                  ? NetworkImage(review.avatars.mediumAvatarUrl!)
                  : NetworkImage(
                      'https://ru.pinterest.com/pin/961026007962154699/'),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.name,
                  style: theme.textTheme.bodyText1!.copyWith(
                      color: theme.primaryColorDark,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  review.reviewDate,
                  style: theme.textTheme.bodyText1!.copyWith(
                      color: theme.primaryColorDark,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            const Spacer(),
            Container(
              width: 42,
              height: 27,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: const Color.fromRGBO(56, 176, 0, 1),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10.5),
                child: Text(
                  review.rating.toStringAsFixed(1),
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 14,
                      ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          review.text,
          style: theme.textTheme.bodyText1!.copyWith(
              color: theme.primaryColorDark,
              fontWeight: FontWeight.w400,
              fontSize: 14),
        )
      ]),
    );
  }
}
