import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../domain/models/attraction_model.dart';
import '../../../navigation/router.gr.dart';

class AttractionCategoryCardHouse extends StatelessWidget {
  final Attraction attraction;

  const AttractionCategoryCardHouse(this.attraction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(DetailsRoute(selectedModel: attraction));
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
            child: Container(
              height: 194,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(attraction.imgSrc!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 15),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('${attraction.name}',
                    style: Theme.of(context).textTheme.headline1?.copyWith(
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
                            '${attraction.starRating}',
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 14,
                                ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 11),
                    Text(
                      '${attraction.reviewCount} отзывов',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
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
                        '${attraction.address} • ${attraction.distance} ${attraction.distType}',
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
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
                      attraction.price != 0 ? 'от ${attraction.price} ₽' : 'Бесплатно',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
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
