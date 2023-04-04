import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../data/network/models/entity/review_api_entity.dart';

class ReviewPlaceSmallCard extends StatelessWidget {
  final ReviewApiEntity review;
  final Function callback;
  const ReviewPlaceSmallCard({Key? key, required this.review, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => callback(),
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(right: 10),
        width: 320,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Color.fromRGBO(149, 157, 165, 0.25), blurRadius: 2)]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: SvgPicture.asset(
                  'assets/images/avatar_icon.svg',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
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
                  color: review.rating.toInt() >= 4
                      ? const Color.fromRGBO(56, 176, 0, 1)
                      : review.rating.toInt() == 0
                          ? Colors.grey
                          : review.rating.toInt() <= 2
                              ? const Color.fromRGBO(255, 47, 47, 1)
                              : const Color.fromRGBO(253, 197, 0, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10.5),
                  child: Text(
                    '${review.rating.toDouble()}',
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
            review.text.length > 120 ? '${review.text.substring(0, 120)}...' : review.text,
            style: theme.textTheme.bodyLarge!
                .copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400, fontSize: 14),
          )
        ]),
      ),
    );
  }
}
