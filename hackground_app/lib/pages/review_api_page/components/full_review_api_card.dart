import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/network/models/entity/review_api_entity.dart';

class FullReviewApiCard extends StatelessWidget {
  final ReviewApiEntity review;
  const FullReviewApiCard({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Color.fromRGBO(149, 157, 165, 0.25), blurRadius: 2)]),
      child: Column(children: [
        Row(
          children: [
            const CircleAvatar(
              maxRadius: 25,
              backgroundImage: NetworkImage('https://i.pinimg.com/564x/d9/7b/bb/d97bbb08017ac2309307f0822e63d082.jpg'),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.userName,
                  style:
                      theme.textTheme.bodyLarge!.copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  DateFormat('d MMMM', 'ru').format(DateTime.parse(review.reviewTime)),
                  style:
                      theme.textTheme.bodyLarge!.copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
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
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10.5),
                child: Text(
                  review.rating.toStringAsFixed(1),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
          style: theme.textTheme.bodyLarge!
              .copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400, fontSize: 14),
        ),
      ]),
    );
  }
}
