import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/network/models/entity/housing_entity.dart';
import '../../../navigation/router.gr.dart';
import '../../../widgets/reviews_rating_widget.dart';

class HousingCard extends StatelessWidget {
  final HousingEntity housing;

  const HousingCard(this.housing, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        context.router.push(DetailsHousingRoute(selectedModel: housing));
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
                imageUrl: 'http://176.119.159.9/media/${housing.placeInfo.photos!.first}',
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: SpinKitSpinningLines(color: theme.indicatorColor),
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 15),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(housing.placeInfo.name,
                    style: theme.textTheme.displayLarge?.copyWith(
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                const SizedBox(height: 6),
                ReviewRatingWidget(selectedModel: housing),
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
                        '${housing.placeInfo.adress.value} ',
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
                      'assets/images/wallet_icon.svg',
                      width: 14,
                      height: 13,
                      color: theme.primaryColorDark,
                    ),
                    const SizedBox(width: 6.42),
                    Text(
                      housing.price.isValid ? 'от ${housing.price.value} ₽' : 'Не указано',
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
