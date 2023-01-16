import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/network/models/entity/tour_entity.dart';
import '../../../navigation/router.gr.dart';
import '../../detailis_exursion_page/detailis_exursion_page.dart';

class ExcursionCard extends StatelessWidget {
  final TourEntity excursion;

  const ExcursionCard({Key? key, required this.excursion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(DetailisExursionRoute(selectedModel: excursion));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                blurRadius: 24,
                color: Color.fromRGBO(149, 157, 165, 0.25),
              )
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              width: double.infinity,
              height: 194,
              child: Image.network(
                excursion.coverImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 20, top: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(excursion.title,
                        style: Theme.of(context).textTheme.headline1?.copyWith(
                              color: const Color.fromRGBO(44, 44, 46, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 1, horizontal: 6),
                          width: 33,
                          height: 19,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: const Color.fromRGBO(56, 176, 0, 1),
                          ),
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
                        const SizedBox(width: 11),
                        Text(
                          '${excursion.reviewCount} отзывов',
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    color: const Color.fromRGBO(44, 44, 46, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/images/vector_icon.svg',
                          color: const Color.fromRGBO(44, 44, 46, 1),
                          width: 13,
                          height: 14.17,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            excursion.meetingPoint?.text ??
                                'Место встречи не указано',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                  color: const Color.fromRGBO(44, 44, 46, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/hourglass_icon.svg',
                          color: const Color.fromRGBO(44, 44, 46, 1),
                          width: 11.33,
                          height: 14.17,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            excursion.duration != null
                                ? '${excursion.duration} часов • ${excursion.movementType == 'car' ? 'На машине' : excursion.movementType == 'foot' ? 'Пешком' : 'На автобусе'}'
                                : 'Время не указано',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
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
                          excursion.price.value != 0
                              ? '${excursion.price.value} ₽ за экскурсию'
                              : 'Не указано',
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
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
