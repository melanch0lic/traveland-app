import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/network/models/entity/tour_entity.dart';
import '../../../navigation/router.gr.dart';

class ExcursionCard extends StatelessWidget {
  final TourEntity excursion;

  const ExcursionCard({Key? key, required this.excursion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        context.router.push(DetailisExursionRoute(selectedModel: excursion));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15), boxShadow: const [
          BoxShadow(
            blurRadius: 24,
            color: Color.fromARGB(62, 36, 46, 56),
          )
        ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              width: double.infinity,
              height: 194,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: excursion.coverImage,
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: SpinKitSpinningLines(color: theme.indicatorColor),
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 15),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(excursion.title,
                    style: theme.textTheme.displayLarge?.copyWith(
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10.5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: excursion.rating.toInt() >= 4
                            ? const Color.fromRGBO(56, 176, 0, 1)
                            : excursion.rating.toInt() == 0
                                ? Colors.grey
                                : excursion.rating.toInt() <= 2
                                    ? const Color.fromRGBO(255, 47, 47, 1)
                                    : const Color.fromRGBO(253, 197, 0, 1),
                      ),
                      child: Text(
                        excursion.rating.toStringAsFixed(1),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${excursion.reviewCount} отзывов',
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
                        excursion.meetingPoint?.text ?? 'Место встречи не указано',
                        style: theme.textTheme.bodyMedium?.copyWith(
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
                            ? '${excursion.duration!.toInt()} часов • ${excursion.movementType == 'car' ? 'На машине' : excursion.movementType == 'foot' ? 'Пешком' : 'На автобусе'}'
                            : 'Время не указано',
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
                      excursion.price.value != 0 ? '${excursion.price.value.toInt()} ₽ за экскурсию' : 'Не указано',
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
