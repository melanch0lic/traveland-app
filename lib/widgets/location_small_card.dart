import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

import '../data/network/models/entity/place_entity.dart';
import '../navigation/router.gr.dart';

class LocationSmallCard extends StatelessWidget {
  final PlaceEntity place;

  const LocationSmallCard({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        context.router.push(DetailisLocationRoute(selectedModel: place));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 227,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15), boxShadow: [
          BoxShadow(
            blurRadius: 5,
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
                  child: place.placeInfo.photos!.isNotEmpty
                      ? CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: 'http://176.119.159.9/media/${place.placeInfo.photos!.first}',
                          progressIndicatorBuilder: (context, url, progress) => Center(
                            child: SpinKitSpinningLines(color: theme.indicatorColor),
                          ),
                        )
                      : Image.asset('assets/images/not_loaded.png', fit: BoxFit.cover),
                ),
                if (place.placeInfo.meanRating.isValid)
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
                          style: theme.textTheme.bodyMedium?.copyWith(
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
                        style: theme.textTheme.displayLarge?.copyWith(
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
                            place.placeInfo.adress.value,
                            style: theme.textTheme.bodyMedium?.copyWith(
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
                        'assets/images/wallet_icon.svg',
                        width: 14,
                        height: 13,
                        color: theme.primaryColorDark,
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
