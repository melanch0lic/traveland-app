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
        CircleAvatar(
          maxRadius: 35,
          backgroundColor: Colors.grey,
          backgroundImage: selectedModel.guide.avatarImages.mediumAvatarUrl != null
              ? NetworkImage(selectedModel.guide.avatarImages.mediumAvatarUrl!)
              : const NetworkImage('https://ru.pinterest.com/pin/961026007962154699/'),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              selectedModel.guide.name,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 16,
                    color: const Color.fromRGBO(44, 44, 46, 1),
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 5),
            Text(
              'Гид во Владикавказе',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 14,
                    color: const Color.fromRGBO(44, 44, 46, 1),
                    fontWeight: FontWeight.w400,
                  ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 6),
                  width: 33,
                  height: 19,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: const Color.fromRGBO(56, 176, 0, 1),
                  ),
                  child: Row(
                    children: [
                      Text(
                        selectedModel.guide.rating.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 14,
                            ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  '${selectedModel.guide.reviewCount.toInt()} отзывов',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
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
