import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../../models/attraction_model.dart';

import '../../../navigation/router.gr.dart';
import '../../../unities.dart';

class AttractionCardHouse extends StatelessWidget {
  final Attraction attraction;

  const AttractionCardHouse(this.attraction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(DetailsRoute(selectedModel: attraction));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(4),
        height: 222,
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
              child: Container(
                height: 151,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(attraction.imgSrc!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        attraction.name!,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
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
                              attraction.starRating.toString(),
                              style: const TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'от ${attraction.price} руб',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.place,
                        size: 12,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${attraction.address} • ${attraction.reviewCount} оценок',
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
