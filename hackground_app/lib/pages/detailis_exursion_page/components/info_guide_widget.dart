import 'package:flutter/material.dart';

import '../../../data/network/models/entity/tour_entity.dart';

class InfoGuideWidget extends StatelessWidget {
  const InfoGuideWidget({
    Key? key,
    required this.selectedModel,
  }) : super(key: key);

  final TourEntity selectedModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          maxRadius: 35,
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage(
              'https://experience-ireland.s3.amazonaws.com/avatar/43bc3264-04e9-11e8-954d-6e714efd800d.150x150.jpg'),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Людмила',
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontSize: 16,
                    color: const Color.fromRGBO(44, 44, 46, 1),
                    fontWeight: FontWeight.w600,
                  ),
            ),
            SizedBox(height: 5),
            Text(
              'Гид во Владикавказе',
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontSize: 14,
                    color: const Color.fromRGBO(44, 44, 46, 1),
                    fontWeight: FontWeight.w400,
                  ),
            ),
            SizedBox(height: 6),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 6),
                  width: 33,
                  height: 19,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: const Color.fromRGBO(56, 176, 0, 1),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '${selectedModel.rating.toStringAsFixed(1)}',
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 14,
                            ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  '${selectedModel.reviewCount.toInt()} отзывов',
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        fontSize: 14,
                        color: const Color.fromRGBO(44, 44, 46, 1),
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
