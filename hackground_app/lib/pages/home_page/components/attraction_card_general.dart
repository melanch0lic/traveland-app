import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackground_app/navigation/router.gr.dart';
import '../../../domain/models/attraction_model.dart';

import '../../../unities.dart';

class AttractionCardGeneral extends StatelessWidget {
  final Attraction attraction;

  const AttractionCardGeneral(this.attraction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(DetailsRoute(selectedModel: attraction));
      },
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 10),
        //padding: const EdgeInsets.only(left: 4, right: 10, top: 4, bottom: 8),
        width: 227,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                offset: Offset.zero,
                color: Colors.black.withOpacity(0.1),
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(children: [
                Container(
                  height: 152,
                  width: 227,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(attraction.imgSrc!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (attraction.starRating != null)
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
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10.5),
                            child: Text(
                              '${attraction.starRating}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 14,
                                  ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
              ]),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SizedBox(
                height: 19,
                child: FittedBox(
                  child: Text('${attraction.name}',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: const Color.fromRGBO(44, 44, 46, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 17.83),
                  child: SvgPicture.asset(
                    'assets/images/Vector.svg',
                    color: const Color.fromRGBO(44, 44, 46, 1),
                    width: 11.33,
                    height: 14.17,
                  ),
                ),
                const SizedBox(width: 8.33),
                Expanded(
                  child: Text(
                    '${attraction.address} • ${attraction.distance} ${attraction.distType}',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: Color.fromRGBO(44, 44, 46, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            attraction.date != null
                ? Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.42),
                        child: SvgPicture.asset(
                          'assets/images/calendar.svg',
                          color: Color.fromRGBO(44, 44, 46, 1),
                          width: 14.17,
                          height: 14.17,
                        ),
                      ),
                      SizedBox(width: 6.42),
                      Text('${attraction.date}'),
                      SizedBox(width: 11.42),
                      SvgPicture.asset(
                        'assets/images/time.svg',
                        color: Color.fromRGBO(44, 44, 46, 1),
                        width: 14.17,
                        height: 14.17,
                      ),
                      SizedBox(width: 6.42),
                      Text('${attraction.clock}'),
                    ],
                  )
                : SizedBox(height: 5),
            attraction.date != null
                ? SizedBox(height: 15)
                : SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.42),
                    child: SvgPicture.asset(
                      'assets/images/Wallet.svg',
                      color: Color.fromRGBO(44, 44, 46, 1),
                      width: 14.17,
                      height: 12.75,
                    ),
                  ),
                  const SizedBox(width: 6.42),
                  Text(
                    attraction.price != 0
                        ? 'от ${attraction.price} ₽'
                        : 'Бесплатно',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: const Color.fromRGBO(44, 44, 46, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
