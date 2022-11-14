import 'package:flutter/material.dart';

import '../../../models/guide_model.dart';

class GuideCard extends StatelessWidget {
  final Guide guide;

  const GuideCard(this.guide, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8, top: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: Offset.zero,
            color: Colors.black.withOpacity(0.1),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage:
                    NetworkImage('https://i.pinimg.com/736x/f1/cc/95/f1cc95ca84baf738d34968996716c8a0.jpg'),
                radius: 40,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      guide.name!,
                      style: const TextStyle(color: Colors.blueAccent, fontSize: 16),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.time_to_leave,
                          color: guide.isCar! ? Colors.green : Colors.red,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          guide.isCar! ? 'Своя машина' : 'Нет собственной машины',
                          style: TextStyle(
                            color: guide.isCar! ? Colors.green : Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (guide.isCar!)
                          Text(
                            guide.carName!,
                            style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                          )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow),
                        Text(
                          '${guide.starRating}',
                          style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8),
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
              ),
            ],
          ),
          const Divider(
            thickness: 1,
          ),
          Padding(
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
