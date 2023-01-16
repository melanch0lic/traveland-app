import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/network/models/entity/tour_entity.dart';
import '../../../domain/models/attraction_model.dart';
import '../../../navigation/router.gr.dart';

class SmallExursionCard extends StatelessWidget {
  final TourEntity excursion;

  const SmallExursionCard({Key? key, required this.excursion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(DetailisExursionRoute(selectedModel: excursion));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 227,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
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
                Container(
                  height: 152,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        excursion.coverImage,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (excursion.rating != null)
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10.5),
                        child: Text(
                          '${excursion.rating}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 14,
                              ),
                        ),
                      ),
                    ),
                  )
              ]),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${excursion.title}',
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                            color: const Color.fromRGBO(44, 44, 46, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                  const SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/images/vector_icon.svg',
                        color: const Color.fromRGBO(44, 44, 46, 1),
                        width: 11.33,
                        height: 14.17,
                      ),
                      const SizedBox(width: 8.33),
                      Expanded(
                        child: Text(
                          'gdfg',
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    color: const Color.fromRGBO(44, 44, 46, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
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
                        excursion.price.value != 0
                            ? 'от ${excursion.price.value} ₽'
                            : 'Бесплатно',
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: const Color.fromRGBO(44, 44, 46, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
