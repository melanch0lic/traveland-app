import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hackground_app/navigation/router.gr.dart';
import '../../../models/attraction_model.dart';

import '../../../unities.dart';

class AttractionCard extends StatelessWidget {
  final Attraction attraction;

  const AttractionCard(this.attraction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(DetailsRoute(selectedModel: attraction));
      },
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        padding: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 8),
        width: 130,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
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
              borderRadius: BorderRadius.circular(10),
              child: Stack(children: [
                Container(
                  height: 96,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(attraction.imgSrc!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (attraction.starRating != null)
                  Positioned(
                    right: 8,
                    bottom: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Units.attractionGradient2,
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 10,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            '${attraction.starRating}',
                            style: const TextStyle(color: Colors.white, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  )
              ]),
            ),
            const SizedBox(height: 4),
            SizedBox(
              height: 12,
              child: FittedBox(
                child: Text(
                  attraction.name!,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(
                  Icons.place,
                  size: 12,
                  color: Colors.red,
                ),
                const SizedBox(width: 4),
                Text(
                  '${attraction.distance} ${attraction.distType} • ${attraction.reviewCount ?? 'Нет'} оценок',
                  style: const TextStyle(fontSize: 9, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 4),
            if (attraction.price != null)
              Text(
                'от ${attraction.price} руб',
                style: const TextStyle(fontSize: 12),
              )
          ],
        ),
      ),
    );
  }
}
