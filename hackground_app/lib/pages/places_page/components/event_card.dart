import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/network/models/entity/event_entity.dart';
import '../../../navigation/router.gr.dart';
import '../../../widgets/reviews_rating_widget.dart';

class EventCard extends StatelessWidget {
  final EventsEntity event;

  const EventCard({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        context.router.push(DetailisEventRoute(selectedModel: event));
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
              width: double.infinity,
              height: 194,
              child: Image.network(
                'http://176.119.159.9/media/${event.placeInfo.photos!.first}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 15),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(event.placeInfo.name,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: const Color.fromRGBO(44, 44, 46, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                const SizedBox(height: 6),
                ReviewRatingWidget(selectedModel: event),
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
                      event.price.isValid ? 'от ${event.price.value} ₽' : 'Бесплатно',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
