import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/network/models/entity/housing_entity.dart';

class HousingCard extends StatelessWidget {
  final HousingEntity housing;

  const HousingCard(this.housing, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        // context.router.push(DetailsRoute(selectedModel: attraction));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15), boxShadow: const [
          BoxShadow(
            blurRadius: 24,
            color: Color.fromRGBO(149, 157, 165, 0.25),
          )
        ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 194,
              width: double.infinity,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: 'https://i.pinimg.com/564x/e6/35/41/e635416caab186b4a13cb45aa058b5af.jpg',
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 15),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(housing.placeInfo.name,
                    style: theme.textTheme.headline1?.copyWith(
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 6),
                      width: 33,
                      height: 19,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: const Color.fromRGBO(56, 176, 0, 1),
                      ),
                      child: Row(
                        children: [
                          Text(
                            '${housing.placeInfo.meanRating.value}',
                            style: theme.textTheme.bodyText2?.copyWith(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 11),
                    Text(
                      '${housing.placeInfo.ratingCount.value} отзывов',
                      style: theme.textTheme.bodyText2?.copyWith(
                        color: const Color.fromRGBO(44, 44, 46, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/vector_icon.svg',
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      width: 11.33,
                      height: 14.17,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '${housing.placeInfo.adress} ',
                        style: theme.textTheme.bodyText2?.copyWith(
                          color: const Color.fromRGBO(44, 44, 46, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/Wallet.svg',
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      width: 14.17,
                      height: 12.75,
                    ),
                    const SizedBox(width: 6.42),
                    Text(
                      'от ${housing.price} ₽',
                      style: theme.textTheme.bodyText2?.copyWith(
                        color: const Color.fromRGBO(44, 44, 46, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              ]))
        ]),
      ),
    );
  }
}
