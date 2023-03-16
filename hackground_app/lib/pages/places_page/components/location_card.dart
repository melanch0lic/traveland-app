import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/network/models/entity/place_entity.dart';
import '../../../navigation/router.gr.dart';

class LocationCard extends StatelessWidget {
  final PlaceEntity place;

  const LocationCard({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        context.router.push(DetailisLocationRoute(selectedModel: place));
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
                imageUrl: 'http://176.119.159.9/media/${place.placeInfo.photos!.first}',
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: SpinKitSpinningLines(color: theme.indicatorColor),
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 15),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(place.placeInfo.name,
                    style: theme.textTheme.displayLarge?.copyWith(
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
                            '${place.placeInfo.meanRating.value}',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 11),
                    Text(
                      '${place.placeInfo.ratingCount.value} отзывов',
                      style: theme.textTheme.bodyMedium?.copyWith(
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
                        '${place.placeInfo.adress.value} ',
                        style: theme.textTheme.bodyMedium?.copyWith(
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
                      place.price.isValid ? 'от ${place.price.value} ₽' : 'Не указано',
                      style: theme.textTheme.bodyMedium?.copyWith(
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
