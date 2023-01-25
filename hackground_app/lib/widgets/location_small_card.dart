import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../data/network/models/entity/place_entity.dart';

class LocationSmallCard extends StatelessWidget {
  final PlaceEntity place;

  const LocationSmallCard({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        // context.router.push(DetailsRoute(selectedModel: place));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 227,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15), boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(0.1),
          )
        ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(children: [
                SizedBox(
                  height: 152,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: 'https://i.pinimg.com/564x/71/cd/5d/71cd5d2217b5fb6b4d63eb9e5062c658.jpg',
                    progressIndicatorBuilder: (context, url, progress) => Center(
                      child: CircularProgressIndicator(
                        value: progress.progress,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  bottom: 15,
                  child: Container(
                    width: 42,
                    height: 27,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: const Color.fromRGBO(56, 176, 0, 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10.5),
                      child: Text(
                        '${place.placeInfo.meanRating.value}',
                        style: theme.textTheme.bodyText2?.copyWith(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                    child: Text(place.placeInfo.name,
                        style: theme.textTheme.headline1?.copyWith(
                          color: const Color.fromRGBO(44, 44, 46, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 30,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/images/vector_icon.svg',
                          color: const Color.fromRGBO(44, 44, 46, 1),
                          width: 12,
                          height: 14,
                        ),
                        const SizedBox(width: 8.33),
                        Expanded(
                          child: Text(
                            place.placeInfo.adress,
                            style: theme.textTheme.bodyText2?.copyWith(
                              color: const Color.fromRGBO(44, 44, 46, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                        'от ${place.price.value} ₽',
                        style: theme.textTheme.bodyText2?.copyWith(
                          color: const Color.fromRGBO(44, 44, 46, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
