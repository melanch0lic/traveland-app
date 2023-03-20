import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../data/network/models/entity/event_entity.dart';
import '../navigation/router.gr.dart';

class EventSmallCard extends StatelessWidget {
  final EventsEntity event;

  const EventSmallCard(this.event, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        context.router.push(DetailisEventRoute(selectedModel: event));
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
                    imageUrl: event.placeInfo.photos!.isNotEmpty
                        ? 'http://176.119.159.9/media/${event.placeInfo.photos!.first}'
                        : 'https://i.pinimg.com/564x/ed/09/b9/ed09b94a7b0a68292129677eebf9bd7e.jpg',
                    progressIndicatorBuilder: (context, url, progress) => Center(
                      child: SpinKitSpinningLines(color: theme.indicatorColor),
                    ),
                  ),
                ),
                if (event.placeInfo.meanRating.isValid)
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
                          '${event.placeInfo.meanRating.value}',
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
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(event.placeInfo.name,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
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
                          event.placeInfo.adress.value,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                        'assets/images/calendar.svg',
                        color: const Color.fromRGBO(44, 44, 46, 1),
                        width: 14.17,
                        height: 14.17,
                      ),
                      const SizedBox(width: 6.42),
                      Text(event.eventDate.isValid
                          ? DateFormat('d MMMM', 'ru').format(DateTime.parse(event.eventDate.value))
                          : 'Не указано'),
                      const SizedBox(width: 11.42),
                      SvgPicture.asset(
                        'assets/images/time.svg',
                        color: const Color.fromRGBO(44, 44, 46, 1),
                        width: 14.17,
                        height: 14.17,
                      ),
                      const SizedBox(width: 6.42),
                      Text(event.eventStartTime.isValid
                          ? DateFormat('HH:mm', 'ru').format(DateTime.parse(event.eventStartTime.value))
                          : 'Не указано'),
                    ],
                  ),
                  const SizedBox(height: 5),
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
                        'от ${event.price.value} ₽',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
