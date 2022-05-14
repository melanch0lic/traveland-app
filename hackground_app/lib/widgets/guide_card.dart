import 'package:flutter/material.dart';

import '../models/guide_model.dart';

class GuideCard extends StatelessWidget {
  final Guide guide;

  GuideCard(this.guide);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 4),
      height: 240,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: Offset.zero,
              color: Colors.black.withOpacity(0.1),
            )
          ]),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            height: 120,
            decoration: BoxDecoration(
              border: Border(
                bottom:
                    BorderSide(width: 1, color: Colors.grey.withOpacity(0.5)),
              ),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://lh3.googleusercontent.com/a-/AAuE7mChgTiAe-N8ibcM3fB_qvGdl2vQ9jvjYv0iOOjB=s96-c'),
                  radius: 50,
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      guide.name!,
                      style: const TextStyle(
                          color: Colors.blueAccent, fontSize: 16),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.time_to_leave,
                          color: guide.isCar! ? Colors.green : Colors.red,
                        ),
                        const SizedBox(width: 2),
                        guide.isCar!
                            ? const Text(
                                'Своя машина',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )
                            : const Text(
                                'Нет собственной машины',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                        const SizedBox(
                          width: 8,
                        ),
                        if (guide.isCar!)
                          Text(
                            guide.carName!,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow),
                        Text(
                          '${guide.starRating}',
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '${guide.reviewCount} отзывов',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('АКТУАЛЬНЫХ МАРШРУТОВ ${guide.actualRoutesCount}'),
                const SizedBox(
                  height: 8,
                ),
                Text('ПОСЛЕДНИЙ МАРШРУТ ${guide.lastRoute}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Подробнее',
                        style: TextStyle(color: Colors.lightBlue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
