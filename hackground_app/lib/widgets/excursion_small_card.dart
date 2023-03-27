import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

import '../data/network/models/entity/tour_entity.dart';
import '../navigation/router.gr.dart';

class ExcursionSmallCard extends StatelessWidget {
  final TourEntity excursion;

  const ExcursionSmallCard({Key? key, required this.excursion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        context.router.push(DetailisExursionRoute(selectedModel: excursion));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 227,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.black.withOpacity(0.1),
              )
            ],
            borderRadius: BorderRadius.circular(15)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(children: [
              SizedBox(
                height: 152,
                width: double.infinity,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: excursion.coverImage,
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: SpinKitSpinningLines(color: theme.indicatorColor),
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
                    color: excursion.rating.toInt() >= 4
                        ? const Color.fromRGBO(56, 176, 0, 1)
                        : excursion.rating.toInt() == 0
                            ? Colors.grey
                            : excursion.rating.toInt() <= 2
                                ? const Color.fromRGBO(255, 47, 47, 1)
                                : const Color.fromRGBO(253, 197, 0, 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10.5),
                    child: Text(
                      '${excursion.rating}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
              children: [
                SizedBox(
                  height: 40,
                  child: Text(excursion.title,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            color: const Color.fromRGBO(44, 44, 46, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/duration.svg',
                      width: 12,
                      height: 16,
                      color: theme.primaryColorDark,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      excursion.duration != null
                          ? '${excursion.duration!.toInt()} часов • ${excursion.movementType == 'car' ? 'На машине' : excursion.movementType == 'foot' ? 'Пешком' : 'На автобусе'}'
                          : 'Время не указано',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: const Color.fromRGBO(44, 44, 46, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 15),
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
                    const SizedBox(width: 5),
                    Text(
                      '${excursion.price.value.toInt()} ₽',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: const Color.fromRGBO(44, 44, 46, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      ' ${excursion.price.unitString}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: const Color.fromRGBO(44, 44, 46, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
