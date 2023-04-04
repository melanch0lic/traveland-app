import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/network/models/entity/review_entity.dart';

class FullReviewCard extends StatelessWidget {
  final ReviewEntity review;
  const FullReviewCard({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(bottom: 15),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Color.fromRGBO(149, 157, 165, 0.25), blurRadius: 2)]),
        child: Column(children: [
          Row(
            children: [
              review.avatars.mediumAvatarUrl != null
                  ? CircleAvatar(
                      maxRadius: 25,
                      backgroundImage: NetworkImage(review.avatars.mediumAvatarUrl!),
                    )
                  : ClipRRect(
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
                    review.name,
                    style:
                        theme.textTheme.bodyLarge!.copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    DateFormat('d MMMM', 'ru').format(DateTime.parse(review.reviewDate)),
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
          if (review.photos!.isNotEmpty) ...[
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: review.photos!.length,
                    itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  content: CachedNetworkImage(
                                    progressIndicatorBuilder: (context, url, progress) =>
                                        Center(child: SpinKitFadingCircle(color: theme.indicatorColor)),
                                    imageUrl: review.photos![index].mediumPhotoUrl,
                                    fit: BoxFit.cover,
                                  ),
                                  actions: [
                                    TextButton(
                                      child: Text(tr('close')),
                                      onPressed: () {
                                        Navigator.of(context, rootNavigator: true).pop();
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                progressIndicatorBuilder: (context, url, progress) =>
                                    Center(child: SpinKitFadingCircle(color: theme.indicatorColor)),
                                imageUrl: review.photos![index].mediumPhotoUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )),
              ),
            ),
          ]
        ]),
      ),
    );
  }
}
